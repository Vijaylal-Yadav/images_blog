class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Images blog #{@user.username} "
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
    @albums = @user.albums
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end