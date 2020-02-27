class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_user
  
  def show
    @products = Product.where(user_id: current_user.id)
    
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :bio)
  end 

  def find_user
    @user = current_user
  end 
end
