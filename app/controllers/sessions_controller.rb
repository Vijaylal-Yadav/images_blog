class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfuly"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your credetianls you entered"
      render 'new'
    end
  end

  def destroy
    session.clear
    session.delete(:id)
    session[:id] = nil
    flash[:notice] = "Logged Out"
    redirect_to login_path
  end

end