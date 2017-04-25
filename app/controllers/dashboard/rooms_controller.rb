class Dashboard::RoomsController < DashboardController
  layout "dashboard"

  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = t('.success')
      redirect_to dashboard_rooms_path
    else
      flash.now[:error] = @room.errors.full_messages
      render :new
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params.dup)
      flash[:success] = t('.success')
      redirect_to dashboard_rooms_path
    else
      flash.now[:error] = @room.errors.full_messages
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit :id, :name, :price, :hotel_id
  end
end