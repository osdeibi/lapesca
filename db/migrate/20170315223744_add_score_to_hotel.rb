class AddScoreToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :score, :integer
  end
end
