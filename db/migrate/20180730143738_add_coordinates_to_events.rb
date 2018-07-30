class AddCoordinatesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :latitude, :string
    add_column :events, :longitude, :string
  end
end
