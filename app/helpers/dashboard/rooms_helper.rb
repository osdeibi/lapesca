module Dashboard::RoomsHelper
  def hotels
    Hotel.all.map { |h| [h.name, h.id]}
  end
end