class TracksController < ApplicationController

  before_action :require_user_logon

  def index
    render :index
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    track = Track.new(track_params)

    if track.save
      flash[:success] = "Successfully created track"
      redirect_to track_url(track)
    else
      flash[:errors] = "Cannot create track"
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update

  end

  def destroy

  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id)
  end

end
