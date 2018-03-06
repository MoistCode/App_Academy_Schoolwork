class ArtworksController < ApplicationController
  def show_all_artworks
    artworks = Artwork.all
    render json: artworks
  end

  def index
    user = User.find(params[:user_id])
    render json: user.artworks
  end

  def show_shares
    artwork = Artwork.find(params[:id])
    render json: artwork.shared_artworks
  end

  def create
    created_artwork = Artwork.new(artwork_params)

    if created_artwork.save
      render json: created_artwork
    else
      render json: created_artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    destroyed_artwork = Artwork.find(params[:id])
    destroyed_artwork.destroy
    render json: destroyed_artwork
  end

  def show
    shown_artwork = Artwork.find(params[:id])
    render json: shown_artwork
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end

end
