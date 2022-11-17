class Room::Name::Find

  def self.call
    name = Room::Name::Animals::LIST.sample

    while Room.where(code: name).exists?
      name = Room::Name::Animals::LIST.sample
    end

    name
  end
end
