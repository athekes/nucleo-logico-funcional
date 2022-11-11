class AddCurrentQuestionToRoom < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :current_question, null: true, foreign_key: { to_table: :questions}, type: :uuid
  end
end
