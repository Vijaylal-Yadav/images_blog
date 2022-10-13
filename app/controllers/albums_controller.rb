class AlbumsController < ApplicationController

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


end