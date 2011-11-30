class CommentsController < ApplicationController
  def create
    @post = Post.new(params[:comment])
    params["comment"]["user_id"]=current_user.id
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
end