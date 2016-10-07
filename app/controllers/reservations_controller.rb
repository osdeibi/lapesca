class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:name, :last_name, :email, :phone, :check_in, :check_out, :hotel_id))
    @reservation.cost = set_rooms

  if validate_email && @reservation.is_available? && @reservation.save
      ReservationMailer.pre_reservation_email(@reservation).deliver_now
    redirect_to thank_you_path(token: @reservation.token)
  else
    if !validate_email
    flash[:notice] = "El mail confirmado no es igual al mail de contacto"
  else
    flash[:notice] = "Las fechas seleccionadas no están disponibles"
  end
  redirect_to reservar_hotel_path(@reservation.hotel)
  end
  end

  def index
    @reservation = Reservation.last
    render 'reservation_mailer/pre_reservation_email', layout: 'mailer'
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :last_name, :email, :phone, :check_in, :check_out, :hotel_id, :quantity, :rooms)
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

    return cost
  end
end
