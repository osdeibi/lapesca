class AddFieldsToCalendarDate < ActiveRecord::Migration
  def change
    add_column :calendar_dates, :casablanca, :boolean
    add_column :calendar_dates, :riviera, :boolean
    add_column :calendar_dates, :villadelsol, :boolean
  end
end
