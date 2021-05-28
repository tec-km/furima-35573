class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  
  def index
    @items= Item.all.order("created_at DESC")
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
    render :edit
    end
  end

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :shipping_id, :day_id, :price, :user_id)
  end



  def new
    @item = Item.new
  end

  def show  
    @item = Item.find(params[:id])
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new 
    end

  end


  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :shipping_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end



end
