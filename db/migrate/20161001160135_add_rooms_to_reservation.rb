class AddRoomsToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :rooms, :text
  end
end
