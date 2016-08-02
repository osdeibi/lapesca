class Reservation < ActiveRecord::Base
  belongs_to :hotel

  validates :name, :last_name, :email, :phone, :check_in, :check_out, presence: true

  def is_available?
    @cds = CalendarDate.where(actual_date: self.check_in..self.check_out)
    available = true
    @cds.each do |cd|
      available = false if cd[self.hotel.code] == true
    end
    return available
  end
end
