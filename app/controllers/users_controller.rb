class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit,:destroy, :update]

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

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account has been updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @albums = @user.albums
  end

  def destroy
    @user.destroy
    session.clear if @user == current_user
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account has ben deleted and all the albums associated to the user has also been deleted"
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can edit or delete your own account"
      redirect_to @user
    end
  end

end