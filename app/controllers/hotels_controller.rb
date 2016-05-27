class HotelsController < ApplicationController
  layout "home"

  def index
    @hotels = Hotel.all
  end

  def la_pescalinda
    @hotel = Hotel.find(1) # Id 1: La Pescalinda
    get_recommended_similar
    render 'hotel_detail.html.erb'
  end

  def tropicana
    @hotel = Hotel.find(2)
    get_recommended_similar
    render 'hotel_detail.html.erb'
  end

  def palma_real
    @hotel = Hotel.find(3)
    get_recommended_similar
    render 'hotel_detail.html.erb'
  end

  def riviera_del_rio
    @hotel = Hotel.find(4)
    get_recommended_similar
    render 'hotel_detail.html.erb'
  end

  def nuevo_amanecer
    @hotel = Hotel.find(5)
    get_recommended_similar
    render 'hotel_detail.html.erb'
  end

  def marina_del_rio
    @hotel = Hotel.find(6)
    get_recommended_similar
    render 'hotel_detail.html.erb'
  end

  private
  def get_recommended_similar
    @recommended = Hotel.where(id:1..4)
    @similar = Hotel.where(id:4..6)
  end

end
