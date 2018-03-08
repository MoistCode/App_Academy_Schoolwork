class BandsController < ApplicationController

  def index
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:success] = "Successfully created band. I hope they're good."
      redirect_to band_url(@band)
    else
      flash[:errors] = "Oops, something went wrong. Please try again"
      render :new
    end

  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    band = Band.find_by(id: params[:id])

    if band.update_attributes(band_params)
      flash[:success] = 'Successfully edited band'
      redirect_to band_url(band)
    else
      flash[:error] = 'Unable to edit band'
      redirect_to edit_band_url(band)
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])

    if band.destroy
      flash[:success] = "They were that bad huh?"
      redirect_to bands_url
    else
      flash[:errors] = "Something went wrong, maybe they're undeletable"
      redirect_to bands_url
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
