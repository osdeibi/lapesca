class DashboardController < ApplicationController
  before_action :set_hotels
  http_basic_authenticate_with name: "", password: ""

  def index
  end

  def reservations
    @reservations = Reservation.all.order(id: :desc)
  end

  def confirm
    @reservation = Reservation.find(params[:id])
    @reservation.update(status: 1)
    ReservationMailer.confirm_reservation_email(@reservation).deliver_now
    redirect_to '/dashboard/reservations'
  end

  def calendar
    @hotel = Hotel.find(params[:id])
    @calendar_dates = CalendarDate.where(@hotel.code => true) # true marks full capacity
    @dates = Array.new
    @calendar_dates.each do |cd|
      @dates.push({:title => 'Lleno [x]', :start => cd.actual_date, :url => clear_calendar_date_path(@hotel, cd)})
    end
  end

  def clear_calendar_date
    @hotel = Hotel.find(params[:id])
    @cd = CalendarDate.find(params[:calendar_date_id])
    @cd.update(@hotel.code => false) # full capacity: false
    redirect_to :calendar
  end

  def fill_calendar_date
    @hotel = Hotel.find(params[:id])
    cd = Date.parse(params[:started])
    @cd = CalendarDate.find_by(actual_date: cd)

    if @cd
      @cd.update(@hotel.code => true) # full capacity: true
    else
      @cd = CalendarDate.create(@hotel.code => true, :actual_date => cd)
    end
    redirect_to :calendar
  end

  private

  def set_hotels
    @hotels = Hotel.all
  end
end
