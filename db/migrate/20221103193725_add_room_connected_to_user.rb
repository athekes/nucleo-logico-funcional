class AddRoomConnectedToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :room, null: true, foreign_key: true
  end
end
