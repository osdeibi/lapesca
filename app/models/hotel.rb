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

  has_many :reservations, dependent: :destroy 
  has_many :calendar_dates, dependent: :destroy
  has_many :rooms, dependent: :destroy

  enum category: { hotel: 0, house: 1, bungalow: 2, country: 3 }
  
  enum status: { inactive: 0, active: 1 }

  def self.boolean_to_string(value)
    (value)? "Si" : "No"
  end
end
