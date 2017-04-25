class AddLatLongToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :latitude, :string
    add_column :hotels, :longitude, :string
  end
end
