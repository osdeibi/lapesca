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
end
