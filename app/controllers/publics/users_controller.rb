class Publics::UsersController < Publics::ApplicationController
  def index
    @user = User.find(current_user.id)
    @matchings = @user.following & @user.followed
  end

  def show
    @user = User.find(params[:id])
    @like = Like.where(user_id: @user.id)
    # 相互フォロー もしくは @user がログインユーザーの場合
    if !current_user.following?(@user).nil? && !current_user.followed?(@user).nil? || @user == current_user
      # Why: blockメソッドを条件分岐で利用するために必須
      if @user != current_user
        # フォローしているユーザー(@user)をブロックしていた場合
        redirect_to user_path(current_user) if current_user.following?(@user).block == true
        # DM機能
        @room_id = (@user.entries.pluck(:room_id) & current_user.entries.pluck(:room_id)).first
        unless @room_id
          @room = Room.new
          @entry = Entry.new
        end
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def matching
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) if @user.id != current_user.id
    # ログインユーザーの住所情報取得
    @area = current_user.prefecture
    # ログインユーザーの好きなゲーム種類の取得
    @games = current_user.gamegenre_ids
    # ユーザーモデルに<好きなゲーム種類テーブル>と<マッチングテーブル>を追加
    @all_user = User.joins(:likes).left_outer_joins(:following_relationships)
    # ログインユーザー情報の除外と、ログインユーザーの好きなゲーム種類で絞り込み
    @matching = @all_user.where.not(id: current_user.id).where(prefecture: @area).where(likes: { gamegenre_id: @games }).uniq.sample(8)
  end

  def info
    @id = params[:user_id]
    @user = User.find(@id)
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) if @user.id != current_user.id
  end

  def edit2
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user
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
    else
      render :edit
    end
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to root_path
  end

  def block; end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana,
                                 :last_name_kana, :nickname, :prefecture,
                                 :active_area, :active_time, :active_content,
                                 :game_name, :introduction, :image_profile_id,
                                 :email, gamegenre_ids: [])
  end
end
