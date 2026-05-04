class SessionsController < ApplicationController
  def new
    render "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.username} to Alpha Blog, Logged In successfully"
      redirect_to user
    else
      flash.now[:alert] = "Invalid email or password"
      render "sessions/new", status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully!"
    redirect_to root_path
  end
end
