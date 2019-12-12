class Publics::UsersController < Publics::ApplicationController
  def index
    @user = User.find(current_user.id)
    @matcher = @user.following_relationships && @user.follower_relationships
    @matcher.each do |f|
      @matching_id = f.follower_id
    end
    @matching = User.where
  end

  def show
    @user = User.find(params[:id])
    @like = Like.where(user_id: @user.id)
  end

  def matching
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user.id)
    end
    # 以下条件に沿ったユーザーデータの取得
    @current = current_user
    # ログインユーザーの住所情報取得
    @area = @current.prefecture
    # ログインユーザーの好きなゲーム種類の取得
    @games = @current.gamegenre_ids
    # ユーザーモデルに<好きなゲーム種類テーブル>と<マッチングテーブル>を追加
    @all_user = User.joins(:likes).left_outer_joins(:following_relationships)
    # ログインユーザー情報の除外と、ログインユーザーの好きなゲーム種類で絞り込み
    @matching = @all_user.where.not(id: @current.id).where(likes:{gamegenre_id: @games}).uniq.shuffle.take(8)
  end

  def info
    @id = params[:user_id]
    @user = User.find(@id)
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user.id)
    end
  end

  def edit2
    @user = User.find(params[:id])
    unless current_user
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
