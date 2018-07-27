class ReservationsController < ApplicationController
  before_action :set_hotels
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.check_in = format_date(reservation_params[:check_in])
    @reservation.check_out = format_date(reservation_params[:check_out])
    set_rooms

    if validate_email && @reservation.is_available? && @reservation.save
      ReservationMailer.pre_reservation_email(@reservation).deliver_now
      redirect_to thank_you_path(token: @reservation.token)
    elsif !validate_email
      flash[:notice] = "El mail confirmado no es igual al mail de contacto"
      redirect_to :back
    else
      @reservation.status = :rejected
      @reservation.save
      redirect_to reservar_hotel_path(@reservation.hotel, not_available: true)
    end
  end

  def index
    @reservation = Reservation.last
    render 'reservation_mailer/pre_reservation_email', layout: 'mailer'
  end

  def edit
    @reservation = Reservation.find(params[:id])
    render layout: 'dashboard'
  end

  def show
    @reservation = Reservation.find_by(token: params[:token])
    render 'edit', layout: 'dashboard'
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(update_params)
    render 'edit', layout: 'dashboard'
  end

  def contacto
    ReservationMailer.contact_email(params[:name], params[:email], params[:comment]).deliver_now
    flash[:notice] = "Gracias, hemos recibido tu contacto"
    redirect_to '/'
  end

  private
  def format_date(date_at)
    check = date_at.split("/")  
    "#{check.third}-#{check.first}-#{check.second}" 
  end

  def reservation_params
    params.require(:reservation).permit(:name, :last_name, :email, :phone, :check_in, :check_out, :hotel_id, :quantity, :rooms)
  end

  def update_params
    params.require(:reservation).permit(:cost, :paid_amount, :reserve_amount)
  end

  def validate_email
    @reservation.email == params[:confirm_email]
  end

  def set_rooms
    rooms = params[:reservation][:rooms]
    quantities = params[:reservation][:quantity]
    @rooms = Array.new
    iterator = 0
    cost = 0.0

    rooms.each do |room|
      @rooms.push({id: room[1].to_i, quantity: quantities[iterator.to_s].to_i}) unless quantities[iterator.to_s] == "0"
      cost += Room.find(room[1].to_i).price * quantities[iterator.to_s].to_f unless quantities[iterator.to_s] == "0"
      iterator += 1
    end

    @reservation.rooms = @rooms
    @reservation.cost = cost * (@reservation.check_out - @reservation.check_in).to_i
    @reservation.paid_amount = 0.0
    @reservation.reserve_amount = @reservation.cost * 0.5
  end
  def set_hotels
    @hotels = Hotel.all
  end
end
