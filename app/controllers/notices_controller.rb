class NoticesController < ApplicationController
  before_action :authenticate_user!

  def new
    @notice = Notice.new
  end

  def create
    @notice = current_user.notices.new(notice_params)
    if @notice.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body, :all_tags)
  end

end