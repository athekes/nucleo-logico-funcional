class RoomsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"

    room = Room.find(params[:id])
    stream_for room

    RoomsChannel.broadcast_to(room, 'Assinatura realizada')
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
