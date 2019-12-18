class Admins::UsersController < ApplicationController
  def index
  	@users = User.all
  	@users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @like = Like.where(user_id: @user.id)
  end

  def destroy
  end
end
