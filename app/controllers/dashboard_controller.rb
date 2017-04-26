class DashboardController < ApplicationController
  before_action :set_hotels
  http_basic_authenticate_with name: "hdlgarza", password: ENV['GMAIL_PASSWORD']

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
    @calendar_dates = @hotel.calendar_dates
    @dates = []
    @calendar_dates.each do |cd|
      @dates.push({:title => 'Lleno [x]', :start => cd.actual_date, :url => clear_calendar_date_path(@hotel, cd)})
    end
  end

  def clear_calendar_date
    @hotel = Hotel.find(params[:id])
    @hotel.calendar_dates.find(params[:calendar_date_id]).destroy
    @dates = []
    @hotel.calendar_dates.each do |cd|
      @dates.push({:title => 'Lleno [x]', :start => cd.actual_date, :url => clear_calendar_date_path(@hotel, cd)})
    end
    redirect_to :calendar
  end

  def fill_calendar_date
    @hotel = Hotel.find(params[:id])
    date = Date.parse(params[:started])

    if @hotel.calendar_dates.where(actual_date: date).blank?
      @hotel.calendar_dates.create(actual_date: date)
    end

    redirect_to :calendar
  end

  private

  def set_hotels
    @hotels = Hotel.all
  end
end
