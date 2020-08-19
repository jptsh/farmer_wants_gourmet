class AddCoordinatesToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :address, :string
    add_column :boxes, :latitude, :float
    add_column :boxes, :longitude, :float
  end
end
