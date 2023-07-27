class CommentsController < ApplicationController
    def new 
     @comment = Comment.new
     @post = Post.find(params[:post_id])
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.build(comment_params)
        @comment.post = @post
        @comment.author_id = current_user.id
    
        if @comment.save
            redirect_to user_post_path(current_user,params[:post_id])
        else
            render :new
        end
        end

    private

    def comment_params
        params.require(:comment).permit(:text)
    end
end
