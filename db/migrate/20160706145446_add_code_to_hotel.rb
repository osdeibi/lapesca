class AddCodeToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :code, :string
  end
end
