class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    p @reservation
    p @reservation.is_available?
    if @reservation.is_available? && @reservation.save
    render plain: "ok"
  else
    render json: {errors: @reservation.errors}, status: :unprocessable_entity
  end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :last_name, :email, :phone, :check_in, :check_out, :hotel_id)
  end
end
