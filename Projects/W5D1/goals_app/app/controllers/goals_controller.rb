class GoalsController < ApplicationController
  def new
  end

  def index
  end

  def create
    goal = Goal.new(goal_params)
    goal.user_id = current_user.id

    if goal.save
      redirect_to goal_url(goal)
    else
      render :new
    end
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def update
    @goal = current_user.goals.find_by(id: params[:id])

    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      render :edit
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:goal)
  end
end
