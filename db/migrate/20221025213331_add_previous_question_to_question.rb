class AddPreviousQuestionToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :previous_question, null: true, foreign_key: { to_table: :rooms }
  end
end
