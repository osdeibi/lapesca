module HotelsHelper
  def hotel_lat_long
    Hotel.where.not(latitude: nil, longitude: nil)
  end
end
