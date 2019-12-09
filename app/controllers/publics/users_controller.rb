class Publics::UsersController < Publics::ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def matching
  end

  def info
  end

  def edit
  end

  def edi2
  end

  def update
  end

  def update2
  end

  def destroy
  end

  def block
  end
end
