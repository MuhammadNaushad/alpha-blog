class UsersController < ApplicationController
def index
  @users = User.paginate(page: params[:page], per_page: 5)
  render "auth/index"
end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    render "auth/show"
  end

  def new
    @user = User.new
    render "auth/new"
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{@user.username}, You have successfully sign up"
      redirect_to users_path
    else
      render "auth/new"
    end
  end

  def edit
    @user = User.find(params[:id])
    render "auth/edit"
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Account informations updated successfully!"
      redirect_to @user # user_path(@user)
    else
      render "auth/edit"
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
