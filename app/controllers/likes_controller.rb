class LikesController < ApplicationController
  def create
    @post = params[:post_id]
    @user = current_user
    @like = Like.new(author_id: @user.id, post_id: @post)

    if @like.save
      flash[:success] = 'You liked the post.'
    else
      flash.now[:error] = 'you already liked this post.'
    end

    redirect_to user_post_path(@user.id, @post)
  end
end
