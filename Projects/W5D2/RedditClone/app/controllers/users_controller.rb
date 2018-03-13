class UsersController < ApplicationController

  def show
    if params[:username]
      @user = User.find_by(username: params[:username])
    else
      @user = User.find(params[:id])
    end

    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
    render :edit
  end

  def update
    if current_user.update(user_params)
      logout
      redirect_to new_session_url
    else
      flash[:errors] = current_user.errors.full_messages
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
