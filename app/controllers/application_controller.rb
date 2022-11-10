class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authorize_request

  private

  def authorize_request
    token = request.headers['AuthorizationToken']

    @current_user = User.find_by(token: token)
    render json: { message: "user not found" }, status: :unauthorized if @current_user.blank?
  end
end
