class AddRefHotelToCalendarDate < ActiveRecord::Migration
  def change
    add_reference :calendar_dates, :hotel, index: true, foreign_key: true
  end
end
