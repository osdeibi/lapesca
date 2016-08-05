class ReservationMailer < ApplicationMailer
  default from: 'info@lapescatamaulipas.com'

  def pre_reservation_email(reservation)
    @reservation = reservation
    mail(to: @reservation.email, subject: 'Solicitud de reservación')
  end
end
