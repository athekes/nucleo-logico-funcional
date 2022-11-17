class DeleteOldRoomsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    roms_to_delete = Room.where("created_at <= :one_hour_a_go", one_hour_a_go: 1.hours.ago)

    roms_to_delete.destroy_all
  end
end
