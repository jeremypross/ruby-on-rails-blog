class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render :json => @comments
  end

  def create
    @comment = Post.find(params[:post_id]).comments.create(comment_params)
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params
    .require(:comment)
    .permit(:comment_text)
  end
end
