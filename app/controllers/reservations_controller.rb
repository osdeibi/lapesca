class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.is_available? && @reservation.save
    redirect_to thank_you_path(token: @reservation.token)
  else
    flash[:notice] = "Las fechas seleccionadas no están disponibles"
    redirect_to reservar_hotel_path(@reservation.hotel)
  end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :last_name, :email, :phone, :check_in, :check_out, :hotel_id)
  end
end
