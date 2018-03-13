class SubsController < ApplicationController
  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:error] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = current_user.subs.find_by(params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find_by(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:error] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    current_user.subs.find_by(params[:id]).destroy
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
