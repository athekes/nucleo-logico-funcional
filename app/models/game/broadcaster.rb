module Game
  class Broadcaster
    def initialize(destination:)
      @destination = destination
    end

    def send(data)
      RoomsChannel.broadcast_to(@destination, data.to_json)
    end
  end
end
