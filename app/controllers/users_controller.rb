class UsersController < ApplicationController
  def new
    @user = User.new
    render "auth/new"
  end

  def create
  end
end
