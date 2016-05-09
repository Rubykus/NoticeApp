class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_authorization, only: [:edit, :update]
  before_action :set_user
  def index
  end

  def show
    @user = User.find_by_id(params[:id])
    @notices = Notice.all.where("user_id = ?", current_user.id)
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:alert] = "Something went wrong. Please try again"
      render :edit
    end
  end

  def explore
  end

  private

  def check_authorization
    unless current_user.id == params[:id].to_i
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:username, :avatar)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

end
