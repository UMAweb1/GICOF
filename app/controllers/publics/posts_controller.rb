class Publics::PostsController < Publics::ApplicationController
  def index
    @user = current_user
    @matching_ids = @user.following_ids & @user.followed_ids
    @matching_ids << @user.id
    @posts = Post.joins(:user).where(user_id: @matching_ids).order("created_at":"DESC").page(params[:page]).per(15)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_path, danger: "投稿が失敗しました"
    end
  end

  def new
    @new_post = Post.new
  end

  def destroy
  end
  private
  def post_params
    params.require(:post).permit(:user_id, :post, :post_image)
  end
end
