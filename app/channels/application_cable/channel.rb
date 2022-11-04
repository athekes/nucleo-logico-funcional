module ApplicationCable
  class Channel < ActionCable::Channel::Base
    include ActionController::Cookies
  end
end
