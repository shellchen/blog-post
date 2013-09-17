class CommentsController < ApplicationController
  before_action :set_post, :require_user

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: "Comment was created successfully."
    else
      redirect_to @post, alert: "Comment can\'t be blank."
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end