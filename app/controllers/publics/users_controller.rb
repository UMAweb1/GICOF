class Publics::UsersController < Publics::ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @like = Like.where(user_id: @user.id)
  end

  def matching
  end

  def info
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user.id)
    end
  end

  def edit2
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @like = Like.where(user_id: @user.id)
    if @user.update(user_params)
      respond_to do |format|
        format.html
        format.js
        format.json
      end
    end
  end

  def update2
  end

  def destroy
  end

  def block
  end
  private
  def user_params
    params.require(:user).permit( :first_name, :last_name, :first_name_kana,
                                  :last_name_kana, :nickname, :prefecture,
                                  :active_area, :active_time, :active_content,
                                  :game_name, :introduction, :image_profile,
                                  :email, { gamegenre_ids:[]})
  end
end
