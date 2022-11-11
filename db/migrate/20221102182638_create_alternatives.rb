class CreateAlternatives < ActiveRecord::Migration[7.0]
  def change
    create_table :alternatives, id: :uuid do |t|
      t.string :body
      t.references :question, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
