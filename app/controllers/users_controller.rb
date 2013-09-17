class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = Post.where(user: @user)
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Registration successfully."
      redirect_to root_path
    else
      flash[:error] = "Faild."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end