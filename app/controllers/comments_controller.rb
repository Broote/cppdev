class CommentsController < ApplicationController
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, :through => :post

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
    end
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end