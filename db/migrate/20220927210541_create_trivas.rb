class CreateTrivas < ActiveRecord::Migration[7.0]
  def change
    create_table :trivas do |t|
      t.string :title

      t.timestamps
    end
  end
end
