class DeleteOldRoomsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    rooms_to_delete = Room
      .left_outer_joins(:connected_users)
      .where(connected_users: { id: nil })
      .where("rooms.created_at <= :one_hour_a_go", one_hour_a_go: 1.hours.ago)

    rooms_to_delete.destroy_all
  end
end
