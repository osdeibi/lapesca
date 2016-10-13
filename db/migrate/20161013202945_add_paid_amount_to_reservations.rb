class AddPaidAmountToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :paid_amount, :decimal
    add_column :reservations, :reserve_amount, :decimal
  end
end
