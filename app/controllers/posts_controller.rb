class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def edit
    unless @post.user == current_user
      flash[:alert] = "You are not the owner."
      redirect_to root_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was updated successfully."
    else
      flash[:alert] = "Title can\'t be blank."
      render :edit
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.find(current_user)
    if @post.save
      redirect_to @post, notice: "Post was created successfully."
    else
      flash[:alert] = "Title can\'t be blank."
      render :new
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end
end
