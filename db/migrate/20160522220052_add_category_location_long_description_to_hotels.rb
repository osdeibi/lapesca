class AddCategoryLocationLongDescriptionToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :category, :integer
    add_column :hotels, :location, :string
    add_column :hotels, :long_description, :text
  end
end
