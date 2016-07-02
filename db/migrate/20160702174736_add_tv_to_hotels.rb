class AddTvToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :tv, :boolean
  end
end
