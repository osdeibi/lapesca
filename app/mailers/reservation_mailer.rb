class ReservationMailer < ApplicationMailer
  default from: 'info@lapescatamaulipas.com'

  def pre_reservation_email(reservation)
    @reservation = reservation
    mail(to: @reservation.email, subject: 'Solicitud de Reservación en ' + @reservation.hotel.name)
  end

  def confirm_reservation_email(reservation)
    @reservation = reservation
    mail(to: @reservation.email, subject: 'Confirmación de ' + @reservation.hotel.name)
  end

  def contact_email(name, email, text)
    @text = text
    @email = email
    @name = name
    mail(to: 'contacto@lapescatamaulipas.com', subject: 'Contacto de ' + name)
  end
end
