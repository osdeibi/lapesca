class HotelsController < ApplicationController
  layout "home"

  def index
    @page = 1
    @page = params[:page].to_i if params[:page]
    @q = Hotel.ransack(params[:q])
    @hotels = @q.result(distinct: true).order(:id).page params[:page]
    paginate

  end

  def reservar
    @hotel = Hotel.find(params[:id])
  end

  def la_pescalinda
    @hotel = Hotel.find(1) # Id 1: La Pescalinda
    get_recommended_similar
    render 'show.html.erb'
  end

  def tropicana
    @hotel = Hotel.find(2)
    get_recommended_similar
    render 'show.html.erb'
  end

  def palma_real
    @hotel = Hotel.find(3)
    get_recommended_similar
    render 'show.html.erb'
  end

  def riviera_del_rio
    @hotel = Hotel.find(4)
    get_recommended_similar
    render 'show.html.erb'
  end

  def nuevo_amanecer
    @hotel = Hotel.find(5)
    get_recommended_similar
    render 'show.html.erb'
  end

  def marina_del_rio
    @hotel = Hotel.find(6)
    get_recommended_similar
    render 'show.html.erb'
  end

  def villa_del_mar
    @hotel = Hotel.find(9)
    get_recommended_similar
    render 'show.html.erb'
  end

  def la_escollera
    @hotel = Hotel.find(8)
    get_recommended_similar
    render 'show.html.erb'
  end

  def punta_piedra
    @hotel = Hotel.find(10)
    get_recommended_similar
    render 'show.html.erb'
  end

  def maria_esperanza
    @hotel = Hotel.find(11)
    get_recommended_similar
    render 'show.html.erb'
  end

  def show
    @hotel = Hotel.find(params[:id])
    get_recommended_similar
  end

  private
  def get_recommended_similar
    @recommended = Hotel.where(id:1..4)
    @similar = Hotel.where(id:4..6)
  end

  def paginate
    @last_page = (@hotels.total_count / 6)
    @last_page += 1 if @hotels.total_count % 6 > 0
  end
end
