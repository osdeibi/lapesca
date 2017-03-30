class Dashboard::HotelsController < DashboardController
  layout "dashboard"

  def new
    @hotel = Hotel.new category: Hotel.categories.key(params[:category].to_i)
  end

  def index
    @category = Hotel.categories.key(params[:category].to_i)
    @hotels = Hotel.where(category: params[:category])
  end
end