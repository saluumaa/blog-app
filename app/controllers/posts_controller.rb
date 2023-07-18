class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
