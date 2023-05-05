class Room::Name::Find
  class Error < StandardError; end

  def self.call
    available_codes = Room::Name::Animals::LIST - Room.select(:code).map(&:code)

    raise Error, 'No room name available' if available_codes.blank?

    available_codes.sample
  end
end
