class DashboardController < ApplicationController
  def index
  end

  def calendar
    @hotel = Hotel.find(params[:id])
  end
end
