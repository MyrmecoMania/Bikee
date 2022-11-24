class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit destroy update]
  # skip_before_action :authenticate_user!, only: %i[show index]

  def index
    if params[:query].present?
      @bikes = policy_scope(Bike.where("address ILIKE ?", "%#{params[:query]}%"))
    else
      @bikes = policy_scope(Bike)
    end
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window: render_to_string(partial: "info_window", locals: { bike: bike })
      }
    end
  end

  def show
    authorize @bike
    @rent = Rent.new
    # authorize @rent
    @markers =
      [{
        lat: @bike.latitude,
        lng: @bike.longitude,
        info_window: render_to_string(partial: "info_window", locals: { bike: @bike })
      }]
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike

    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @bike
  end

  def update
    authorize @bike
    if @bike.update(bike_params)
      redirect_to bike_path(@bike)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @bike
    @bike.destroy
    redirect_to bikes_path, status: :see_other
  end

  private

  def bike_params
    params.require(:bike).permit(:category, :status, :price_per_day, :address, :brand, photos: [])
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
