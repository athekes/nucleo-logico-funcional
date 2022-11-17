class User < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :owned_rooms, class_name: 'Room', foreign_key: :owner_id, dependent: :destroy

  belongs_to :connected_room, class_name: 'Room', foreign_key: :room_id, optional: true

  def connect_to(room)
    self.update(connected_room: room)
  end

  def disconnect_from_room
    self.update(connected_room: nil)
  end
end
