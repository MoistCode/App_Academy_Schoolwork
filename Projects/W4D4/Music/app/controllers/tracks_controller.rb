class TracksController < ApplicationController

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

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
