class Publics::UsersController < Publics::ApplicationController
  def index
    @user = User.find(current_user.id)
    @matchings = @user.following & @user.followed
  end

  def show
    @user = User.find(params[:id])
    @like = Like.where(user_id: @user.id)
    @current = current_user
    # 相互フォロー もしくは @user がログインユーザーの場合
    if @current.following?(@user) != nil && @current.followed?(@user) != nil || @user == @current
      # @user がログインユーザーではない場合
      if @user != @current
        # フォローしているユーザー(@user)をブロックしていた場合
        if @current.following?(@user).block == true
          redirect_to user_path(@current)
        end
        # DM機能
        @current_user_entry = Entry.where(user_id: @current.id)
        @user_entry = Entry.where(user_id: @user.id)
        @current_user_entry.each do |c_entry|
          @user_entry.each do |u_entry|
            if c_entry.room_id == u_entry.room_id
              @room = true
              @room_id = c_entry.room_id
            end
          end
        end
        unless @room
          @room = Room.new
          @entry = Entry.new
        end
      end
    else
      redirect_to user_path(@current)
    end
  end

  def matching
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user.id)
    end
    @current = current_user
    # ログインユーザーの住所情報取得
    @area = @current.prefecture
    # ログインユーザーの好きなゲーム種類の取得
    @games = @current.gamegenre_ids
    # ユーザーモデルに<好きなゲーム種類テーブル>と<マッチングテーブル>を追加
    @all_user = User.joins(:likes).left_outer_joins(:following_relationships)
    # ログインユーザー情報の除外と、ログインユーザーの好きなゲーム種類で絞り込み
    @matching = @all_user.where.not(id: @current.id).where(prefecture: @area).where(likes:{gamegenre_id: @games}).uniq.sample(8)
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
    else
      render :edit
    end
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to root_path
  end

  def block
  end
  private
  def user_params
    params.require(:user).permit( :first_name, :last_name, :first_name_kana,
                                  :last_name_kana, :nickname, :prefecture,
                                  :active_area, :active_time, :active_content,
                                  :game_name, :introduction, :image_profile_id,
                                  :email, { gamegenre_ids:[]})
  end
end
