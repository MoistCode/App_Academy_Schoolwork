class AlbumsController < ApplicationController

  def index
    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    album = Album.new(album_params)

    if album.save
      flash[:success] = "Successfully created the album!"
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      render :new
    end

  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    album = Album.find_by(id: params[:id])

    if album.update_attributes(album_params)
      flash[:success] = "Successfully editted the album"
      redirect_to album_url(album)
    else
      flash[:error] = "Could not edit the album."
      redirect_to edit_album_url
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])

    if album.delete
      flash[:success] = "Successful Deletion"
      redirect_to albums_url
    else
      flash[:errors] = "Unsuccessful Deletion"
      redirect_to albums_url
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :status, :band_id)
  end
end
