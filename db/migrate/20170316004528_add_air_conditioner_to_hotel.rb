class AddAirConditionerToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :air_conditioner, :boolean
  end
end
