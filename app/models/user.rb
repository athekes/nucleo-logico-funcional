class User < ApplicationRecord
  has_many :answers

  belongs_to :connected_room, class_name: 'Room', foreign_key: 'room_id', optional: true

  validates :token, presence: true

  def connect_to(room)
    self.update(connected_room: room)
  end

  def disconnect_from_room
    self.update(connected_room: nil)
  end
end
