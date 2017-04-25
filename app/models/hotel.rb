class Hotel < ActiveRecord::Base
  has_attached_file :home
  validates_attachment_content_type :home, content_type: /\Aimage\/.*\Z/

  has_attached_file :index
  validates_attachment_content_type :index, content_type: /\Aimage\/.*\Z/

  has_attached_file :page
  validates_attachment_content_type :page, content_type: /\Aimage\/.*\Z/

  has_attached_file :small
  validates_attachment_content_type :page, content_type: /\Aimage\/.*\Z/

  paginates_per 6

  has_many :reservations
  has_many :rooms

  enum category: { hotel: 0, house: 1, bungalow: 2, country: 3 }
  enum status: { inactive: 0, active: 1 }

  def self.boolean_to_string(value)
    (value)? "Si" : "No"
  end

  def self.get_available_hotels(check_in, check_out, hotel_list)
    @available = hotel_list
    if check_in != "" && check_out != ""
    @cds = CalendarDate.where(actual_date: check_in..check_out)
    @novacancy = Array.new
    @cds.each do |cd|
      # metodos dependientes de los nombres de columnas en CalendarDate en la base de datos y codes de hoteles
      @novacancy.push(Hotel.find_by(code: 'maria').id) if cd.maria == true
      @novacancy.push(Hotel.find_by(code: 'riviera').id) if cd.riviera == true
      @novacancy.push(Hotel.find_by(code: 'villadelsol').id) if cd.villadelsol == true
      @novacancy.push(Hotel.find_by(code: 'villa').id) if cd.villa == true
      @novacancy.push(Hotel.find_by(code: 'tropicana').id) if cd.tropicana == true
      @novacancy.push(Hotel.find_by(code: 'escollera').id) if cd.escollera == true
      @novacancy.push(Hotel.find_by(code: 'blanquita').id) if cd.blanquita == true
      @novacancy.push(Hotel.find_by(code: 'nuevoamanecer').id) if cd.nuevoamanecer == true
      @novacancy.push(Hotel.find_by(code: 'casablanca').id) if cd.casablanca == true
      @novacancy.push(Hotel.find_by(code: 'palma').id) if cd.palma == true
      @novacancy.push(Hotel.find_by(code: 'pescalinda').id) if cd.pescalinda == true
      @novacancy.push(Hotel.find_by(code: 'puntapiedra').id) if cd.puntapiedra == true
      @novacancy.push(Hotel.find_by(code: 'marina').id) if cd.marina == true
    end
    @available = @available.where(id: Hotel.all.pluck(:id) - @novacancy)
  end
    return @available
  end
end
