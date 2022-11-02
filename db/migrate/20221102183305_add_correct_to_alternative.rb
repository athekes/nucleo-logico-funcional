class AddCorrectToAlternative < ActiveRecord::Migration[7.0]
  def change
    add_column :alternatives, :correct, :boolean
  end
end
