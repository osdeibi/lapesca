class AddCostToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :cost, :decimal
  end
end
