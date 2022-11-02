class AddPositionToAlternative < ActiveRecord::Migration[7.0]
  def change
    add_column :alternatives, :position, :integer
  end
end
