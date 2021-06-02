class BuyController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  
  def index
    @buy_address = BuyAddress.new
  end

  def create
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

  def move_to_index
    if current_user.id == @item.user_id || @item.buy.present?
      redirect_to root_path
    end
  end

  def  set_item
    @item = Item.find(params[:item_id])
  end

end
