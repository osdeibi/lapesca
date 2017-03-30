class Dashboard::HotelsController < DashboardController
  layout "dashboard"

  def new
    @hotel = Hotel.new category: Hotel.categories.key(params[:category].to_i)
  end

  def index
    @category = Hotel.categories.key(params[:category].to_i)
    @hotels = Hotel.where(category: params[:category]).order(:score)
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def create
    @hotel = Hotel.new hotel_params
    if @hotel.save
      flash[:success] = t('.success')
      redirect_to dashboard_hotels_path(category: Hotel.categories[@hotel.category])
    else
      flash.now[:error] = @hotel.errors.full_messages
      render :new
    end
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params.dup)
      flash[:success] = t('.success')
      redirect_to dashboard_hotels_path(category: Hotel.categories[@hotel.category])
    else
      flash.now[:error] = @hotel.errors.full_messages
      render :edit
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit :id, :name, :code, :cost_per_night, :grill, :pool, :dock,
                                  :restaurant, :shacks, :pet_friendly, :tv, :air_conditioner,
                                  :review_score, :location, :description, :long_description
  end
end