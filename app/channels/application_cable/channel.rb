module ApplicationCable
  class Channel < ActionCable::Channel::Base
    include ActionController::Cookies

    after_subscribe :connection_monitor

    CONNECTION_TIMEOUT = 10.seconds
    CONNECTION_PING_INTERVAL = 5.seconds

    periodically every: CONNECTION_PING_INTERVAL do
      @driver&.ping

      if Time.now - @_last_request_at > CONNECTION_TIMEOUT
        unsubscribed
      end
    end

    def connection_monitor
      @_last_request_at ||= Time.now
      @driver = connection.instance_variable_get('@websocket').possible?&.instance_variable_get('@driver')
      @driver.on(:pong) { @_last_request_at = Time.now }
    end
  end
end
