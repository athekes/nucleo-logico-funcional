class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "messages_channel"
    ActionCable.server.broadcast('messages_channel', Message.all)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
