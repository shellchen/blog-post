class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.username
      flash[:notice] = "Login successfully."
      redirect_to root_path
    else
      flash[:alert] = "Loggin Failed."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logout succeffuly."
    redirect_to root_path
  end
end