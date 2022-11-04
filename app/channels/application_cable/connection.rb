module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include ActionController::Cookies

    identified_by :connected_user

    def connect
      self.connected_user = find_user
    end

    private

    def find_user
      User.find_by(id: cookies[:user_id])
    end
  end
end
