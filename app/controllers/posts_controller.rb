class PostsController < ApplicationController
    def show
        @posts = Post.find(params[:id])
    end
end
