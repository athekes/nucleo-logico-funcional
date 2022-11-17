class DeleteOldUsersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users_to_delete = User.where("created_at <= :one_hour_a_go", one_hour_a_go: 1.hours.ago)

    users_to_delete.destroy_all
  end
end
