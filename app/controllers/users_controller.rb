class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_authorization, only: [:edit, :update]
  before_action :set_user
  def index
    if user_signed_in?
      redirect_to user_url(current_user.id)
    end
  end

  def show
    @user = User.find_by_id(params[:id])

    if params[:category_id].present?
      @notices = Notice.all.where("category_id = ?", params[:category_id])
    elsif params[:tag_name].present?
      @notices = Notice.tagged_with(params[:tag_name])
    else
      @notices = Notice.all.where("user_id = ?", params[:id])
    end

    @categories = Category.all.where("user_id = ?", params[:id].to_i )
    @new_category = Category.new

    @tags = Notice.all.where("user_id = ?", params[:id]).collect{|n| n.tags}.flatten.uniq

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
