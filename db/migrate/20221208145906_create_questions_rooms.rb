class CreateQuestionsRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :questions_rooms, id: :uuid do |t|
      t.belongs_to :question, null: false, foreign_key: true, type: :uuid
      t.belongs_to :room, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
