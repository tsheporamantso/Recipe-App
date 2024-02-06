class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @food = @user.foods 
  end
end
