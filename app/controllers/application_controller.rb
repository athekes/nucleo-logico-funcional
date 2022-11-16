class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authorize_request

  private

  def authorize_request
    if @current_user = User.find(cookies[:user_uuid])
      user
    else
      render json: { message: "user not found" }, status: :unauthorized if @current_user.blank?
    end
  end
end
