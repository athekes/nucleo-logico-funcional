class CreateQuestionaires < ActiveRecord::Migration[7.0]
  def change
    create_table :questionaires, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
