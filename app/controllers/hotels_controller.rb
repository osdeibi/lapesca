class HotelsController < ApplicationController
  layout "home"

  def index
    parse_amounts if params[:amount_end]
    @q = Hotel.all
    @q = Hotel.where('cost_per_night BETWEEN ? AND ?', @amount_start, @amount_end) if @amount_end
    @q = Hotel.get_available_hotels(params[:check_in], params[:check_out], @q) if params[:check_in] && params[:check_out]
    @q = @q.ransack(params[:q])
    @hotels = @q.result(distinct: true).order(:id).page params[:page]
    paginate
  end

  def reservar
    get_recommended_similar
    p @reservation
    @reservation = Reservation.new(hotel_id: params[:id]) unless @reservation
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

  def hotel_blanquita
    @hotel = Hotel.find(12)
    get_recommended_similar
    render 'show.html.erb'
  end

  def villa_del_sol
    @hotel = Hotel.find(13)
    get_recommended_similar
    render 'show.html.erb'
  end

  def show
    @hotel = Hotel.find(params[:id])
    get_recommended_similar

    case @hotel.code
    when 'pescalinda'
      redirect_to '/hotel-lapescalinda'
    when 'tropicana'
      redirect_to '/bungalows-tropicana'
    when 'palmareal'
      redirect_to '/hotel-palma-real-inn'
    when 'riviera'
      redirect_to '/hotel-riviera-del-ro-reservaciones'
    when 'nuevoamanecer'
      redirect_to '/nuevo-amanecer'
    when 'marina'
      redirect_to '/hotel-marina-del-rio'
    when 'villa'
      redirect_to '/hotel-villa-del-mar'
    when 'escollera'
      redirect_to '/hotel-la-escollera'
    when 'puntapiedra'
      redirect_to '/hotel-punta-piedra-bungalows'
    when 'maria'
      redirect_to '/hotel-maria-esperanza'
    when 'blanquita'
      redirect_to '/hotel-blanquita'
    when 'villadelsol'
      redirect_to '/hotel-villa-del-sol'
    end
  end

  private
  def get_recommended_similar
    @recommended = Hotel.limit(4).order("RANDOM()")
    @similar = Hotel.limit(3).order("RANDOM()")
  end

  def paginate
    @page = 1
    @page = params[:page].to_i if params[:page]
    @last_page = (@hotels.total_count / 6)
    @last_page += 1 if @hotels.total_count % 6 > 0
  end

  def parse_amounts
    @amount_start = 0.0
    @amount_start = params[:amount_start][1, params[:amount_start].length].to_f if params[:amount_start]
    @amount_end = params[:amount_end][1, params[:amount_end].length].to_f
  end
end
