module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include ActionController::Cookies

    identified_by :connected_user

    def connect
      self.connected_user = find_user
    end

    private

    def find_user
      user = User.find(cookies[:user_uuid])

      if user&.connected_room.blank?
        user
      else
        reject_unauthorized_connection
      end
    end
  end
end
