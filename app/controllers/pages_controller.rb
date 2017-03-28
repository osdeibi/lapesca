class PagesController < ApplicationController
  layout "home"
  before_action :get_recommended_similar, only: [:tortuga_lora, :el_sabinito, :thank_you, :paseo_en_lancha, :renta_de_kayaks]

  def home
    @recommended_hotels = Hotel.order(:score).limit(5)
  end

  def gallery
  end

  def gallery_detail

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
  end

  def el_sabinito
  end

  def paseo_en_lancha
  end

  def thank_you
    @reservation = Reservation.find_by(token: params[:token])
  end

  private
  def get_recommended_similar
    @recommended = Hotel.limit(4).order("RANDOM()")
    @similar = Hotel.limit(3).order("RANDOM()")
  end
end
