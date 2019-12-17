class Publics::PostsController < Publics::ApplicationController
  def index
    @user = current_user
    @matching_ids = @user.following_ids & @user.followed_ids
    @posts = Post.joins(:user).where(user_id: @matching_ids).order("created_at":"DESC")
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to posts_path
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def destroy
  end
  private
  def post_params
    params.require(:post).permit(:user_id, :post, :post_image)
  end
end
