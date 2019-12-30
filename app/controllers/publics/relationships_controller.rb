class Publics::RelationshipsController < Publics::ApplicationController
  def create
    user = User.find(params[:following_id])
    current_user.follow(user)
    if !current_user.followed?(user).nil?
      redirect_to matching_path(current_user), success: "#{user.nickname}とマッチしました"
    else
      redirect_to matching_path(current_user)
    end
  end

  def update
    # 相互ブロック機能
    @user = User.find(params[:id])
    @following = @user.following_relationships.find_by(following_id: current_user.id)
    @followed = @user.follower_relationships.find_by(follower_id: current_user.id)
    @following.update(block: true)
    @followed.update(block: true)
    # 未読フラグ削除機能
    @room = (@user.entries.pluck(:room_id) & current_user.entries.pluck(:room_id)).first
    @read1 = Entry.where(user_id: current_user).find_by(room_id: @room)
    @read2 = Entry.where(user_id: @user).find_by(room_id: @room)
    if @read1.read == true || @read2.read == true
      @read1.update(read: false)
      @read2.update(read: false)
    end
    redirect_to user_path(current_user)
  end
end
