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

  def vote
    @comment = @post.comments.find(params[:id])
    if Vote.where(voteable: @comment, user: current_user).blank?
      Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
      respond_to do |format|
        format.html do
          flash[:notice] = "Your vote was created."
          redirect_to post_path(@post)
        end
        format.js
      end
    else
      flash[:alert] = "You had voted."
      redirect_to post_path(@post)
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