class PagesController < ApplicationController
  layout "home"

  def home
  end

  def gallery
  end

  def privacy
  end

  def about
  end

  def faqs
  end

  def terms
  end

  def about_us
  end

  def map
  end

  def puerto_la_pesca
  end

  def tortuga_lora
    get_recommended_similar
  end

  def thank_you
    get_recommended_similar
    @reservation = Reservation.find_by(token: params[:token])
  end

  private
  def get_recommended_similar
    @recommended = Hotel.limit(4).order("RANDOM()")
    @similar = Hotel.limit(3).order("RANDOM()")
  end
end
