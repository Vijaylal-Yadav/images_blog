class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @album = Album.new()
  end

  def create
    @album = Album.new(name: params[:album][:name])
    @album.user_id = current_user.id
    if @album.save
      flash[:notice] = "Albums Saved succesfully"
      redirect_to @album
    else
      render 'new'
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit

  end

  def update
    if @album.update(name: params[:album][:name])
      flash[:notice] = "Album Updated Succesfully"
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
    redirect_to current_user
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def require_same_user
    if ( current_user != @album.user)
      flash[:alert] = "You can edit your's album only"
      redirect_to @album
    end
  end

end