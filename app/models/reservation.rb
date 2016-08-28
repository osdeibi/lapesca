class Reservation < ActiveRecord::Base
  belongs_to :hotel
  before_create :add_token
  belongs_to :room

  validates :name, :last_name, :email, :phone, :check_in, :check_out, presence: true

  def is_available?
    @cds = CalendarDate.where(actual_date: self.check_in..self.check_out)
    available = true
    @cds.each do |cd|
      available = false if cd[self.hotel.code] == true
    end
    return available
  end

  def get_reference
    self.name[0].upcase.next + self.name[1].upcase.next + self.last_name[0].upcase.next + self.last_name[1].upcase.next + self.id.to_s
  end

  def add_token
  begin
    self.token = SecureRandom.hex[0,10].upcase
  end while self.class.exists?(token: token)
  end
end
