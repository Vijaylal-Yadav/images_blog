class PicturesController < ApplicationController
  before_action :set_picture_and_album, only: [:edit, :update, :destroy]
  before_action :require_user, except: [:show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @album = Album.find(params[:album])
    @picture = Picture.new(album_id: @album.id)
  end

  def create
    @picture = Picture.new(picture_params)
    @album = Album.find(@picture.album_id)
    if @picture.save
      flash[:notice] = "Picture Saved succesfully"
      redirect_to @album
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @picture.update(tag_line: params[:picture][:tag_line])
      flash[:notice] = "Picture Updated Succesfully"
      redirect_to @album
    else
      render 'edit'
    end
    end

  private

  def set_picture_and_album
    @picture = Picture.find(params[:id])
    @album = Album.find(@picture.album_id)
  end

  def picture_params
    params.require(:picture).permit(:tag_line, :album_id)
  end

  def require_same_user
    if ( current_user != @album.user)
      flash[:alert] = "You can edit your's album only"
      redirect_to @album
    end
  end
end