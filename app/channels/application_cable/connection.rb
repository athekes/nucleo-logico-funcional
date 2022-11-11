module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include ActionController::Cookies

    identified_by :connected_user

    def connect
      self.connected_user = find_user
    end

    private

    def find_user
      if user = User.find(request.params[:user_id])
        user
      else
        reject_unauthorized_connection if user.blank?
      end
    end
  end
end
