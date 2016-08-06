class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.is_available? && @reservation.save
      ReservationMailer.pre_reservation_email(@reservation).deliver_now
    redirect_to thank_you_path(token: @reservation.token)
  else
    flash[:notice] = "Las fechas seleccionadas no están disponibles"
    redirect_to reservar_hotel_path(@reservation.hotel)
  end
  end

  def index
    @reservation = Reservation.last
    render 'reservation_mailer/pre_reservation_email', layout: 'mailer'
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :last_name, :email, :phone, :check_in, :check_out, :hotel_id)
  end
end
