class Message < ApplicationRecord
  after_create :publish_message

  def publish_message
    ActionCable.server.broadcast('messages_channel', self)
  end
end
