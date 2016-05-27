class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.decimal :cost_per_night
      t.text :description
      t.boolean :grill
      t.boolean :pool
      t.boolean :dock
      t.boolean :restaurant
      t.boolean :shacks
      t.boolean :pet_friendly
      t.integer :available
      t.integer :review_score

      t.timestamps null: false
    end
  end
end
