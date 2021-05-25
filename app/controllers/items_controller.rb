class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  
  def index
    
  end

  def edit
    
  end

  def new
    
  end

  def show
    
  end

  def create
    
  end


  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end



end
