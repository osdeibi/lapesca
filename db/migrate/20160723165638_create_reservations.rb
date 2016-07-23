class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :check_in
      t.date :check_out

      t.timestamps null: false
    end
  end
end
