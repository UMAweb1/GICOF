class Publics::RelationshipsController < Publics::ApplicationController
  def create
  	user = User.find(params[:following_id])
  	following = current_user.follow(user)
    if following.save
    	# if user.followed?(current_user)
      # flash[:success] = 'ユーザーをフォローしました'
      redirect_to matching_path(current_user)
    else
      # flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to matching_path(current_user)
    end
  end

  def block
  end
end
