class UsersController < ApplicationController
  def new
    @user = User.new
    render "auth/new"
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{@user.username}, You have successfully sign up"
      redirect_to articles_path
    else
      render "auth/new"
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
