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

  def self.boolean_to_string(value)
    str = "No"
    str = "Si" if value == true
    str
  end

  def self.get_category_string(value)
    case value
    when 2
      str = 'bungalows'
    when 3
      str = 'casa'
    else
      str = 'hotel'
    end

    return str
  end

  def self.get_available_hotels(check_in, check_out, hotel_list)
    @available = hotel_list
    if check_in != "" && check_out != ""
    check_in = Date.strptime(params[:check_in], '%m/%d/%Y')
    check_out = Date.strptime(params[:check_out], '%m/%d/%Y')
    @cds = CalendarDate.where(actual_date: check_in..check_out)
    @novacancy = Array.new
    @cds.each do |cd|
      # metodos dependientes de los nombres de columnas en CalendarDate en la base de datos y codes de hoteles
      @novacancy.push(Hotel.find_by(code: 'pescalinda').id) if cd.pescalinda == true
      @novacancy.push(Hotel.find_by(code: 'tropicana').id) if cd.tropicana == true
      @novacancy.push(Hotel.find_by(code: 'palma').id) if cd.palma == true
      @novacancy.push(Hotel.find_by(code: 'nuevoamanecer').id) if cd.nuevoamanecer == true
      @novacancy.push(Hotel.find_by(code: 'blanquita').id) if cd.blanquita == true
      @novacancy.push(Hotel.find_by(code: 'maria').id) if cd.maria == true
      @novacancy.push(Hotel.find_by(code: 'marina').id) if cd.marina == true
      @novacancy.push(Hotel.find_by(code: 'escollera').id) if cd.escollera == true
      @novacancy.push(Hotel.find_by(code: 'villa').id) if cd.villa == true
      @novacancy.push(Hotel.find_by(code: 'puntapiedra').id) if cd.puntapiedra == true
    end
    @available = @available.where(id: Hotel.all.pluck(:id) - @novacancy)
  end
    return @available
  end
end
