class NoticesController < ApplicationController
  before_action :authenticate_user!

  def new
    @notice = Notice.new
  end

  def edit
    @notice = Notice.find_by_id(params[:id])
  end

  def destroy
    @notice = Notice.find_by_id(params[:id])
    if @notice.user_id == current_user.id
      @notice.destroy
      redirect_to root_path, notice: 'Notice was successfully destroyed.'
    else
      redirect_to root_path, notice: 'You dont can delete someone else notice.'
    end
  end

  def update
    @notice = Notice.find_by_id(params[:id])
    if @notice.user_id == current_user.id
        if @notice.update(notice_params)
          redirect_to root_path, notice: 'Notice was successfully updated.'
        else
          redirect_to root_path, notice: 'Notice didnt updated.'
        end
    else
      redirect_to root_path, notice: 'You dont can edit someone else notice.'
    end
  end

  def create
    @notice = current_user.notices.new(notice_params)
    if @notice.save
      redirect_to root_url, notice: "Notice created"
    else
      redirect_to root_url, notice: "Notice not created"
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body, :all_tags, :color)
  end

end