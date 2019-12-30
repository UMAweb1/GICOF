class Admins::UsersController < Admins::ApplicationController
  def index
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @like = Like.where(user_id: @user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end
end
