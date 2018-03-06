class ArtworkSharesController < ApplicationController

  def index
    artwork_shares = ArtworkShare.all
    render json: artwork_shares
  end

  def create
    created_share = ArtworkShare.new(artwork_share_params)

    if created_share.save
      render json: created_share
    else
      render json: created_share.errors.full_messages, status: 422
    end
  end

  def destroy
    destroyed_share = ArtworkShare.find(params[:id])
    destroyed_share.destroy
    render json: destroyed_share
  end

  private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
