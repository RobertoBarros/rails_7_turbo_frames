class UsersController < ApplicationController
  def index
    if params[:query].present?
      @users = User.where("name LIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
    end

    respond_to do |format|
      if turbo_frame_request? && turbo_frame_request_id == 'search'
        format.html { render partial: 'users_table', locals: { users: @users } }
      else
        format.html
      end
    end

  end
end
