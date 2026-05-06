class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :update, :edit, :destroy ]
  before_action :require_user, only: [ :edit, :update ]
  before_action :require_same_user, only: [ :edit, :update, :destroy ]


def index
  @users = User.paginate(page: params[:page], per_page: 5)
  render "auth/index"
end

  def show
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
      session[:user_id] = @user.id

      flash[:notice] = "Welcome to Alpha Blog #{@user.username}, You have successfully sign up"
      redirect_to articles_path
    else
      render "auth/new"
    end
  end

  def edit
    render "auth/edit"
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account informations updated successfully!"
      redirect_to @user # user_path(@user)
    else
      render "auth/edit"
    end
  end

  def destroy
      @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Your account and associated articles deleted successfully"
        redirect_to articles_path
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit and delete your own profile"
      redirect_to current_user
    end
  end
end
