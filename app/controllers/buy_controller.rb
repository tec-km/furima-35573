class BuyController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item  
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
     params.require(:buy_address).permit(:postal, :prefecture_id, :municipalities, :address, :buildingname,:phone).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
