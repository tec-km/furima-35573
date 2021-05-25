class ItemsController < ApplicationController
  # before_action :authenticate_user!
  
  
  def index
    
  end

  def edit
    
  end

  def new
    
  end

  def show
    
  end


  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end



end
