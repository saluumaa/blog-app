class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @like = Like.new
  end

  def new 
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = current_user.posts.build(post_params)
    @post.author_id = @user.id

    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:text)
  end
end
