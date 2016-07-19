class CreateCalendarDates < ActiveRecord::Migration
  def change
    create_table :calendar_dates do |t|
      t.date :actual_date
      t.boolean :pescalinda
      t.boolean :palma
      t.boolean :tropicana
      t.boolean :nuevoamanecer
      t.boolean :blanquita
      t.boolean :maria
      t.boolean :marina
      t.boolean :escollera
      t.boolean :villa
      t.boolean :puntapiedra

      t.timestamps null: false
    end
  end
end
