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

  end

  def update

  end

  def destroy
    album = Album.find_by(id: params[:id])

    if album.delete
      flash[:success] = "Successful Deletion"
      redirect_to bands_url
    else
      flash[:errors] = "Unsuccessful Deletion"
      redirect_to bands_url
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :status, :band_id)
  end
end
