class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit destroy update]

  def index
    @bikes = policy_scorpe(Bike)
  end

  def show
    # @bike = Bike.find(params[:id])
    authorize @bike
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
    # @bike = Bike.find(params[:id])
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
    # @bike = Bike.find(params[:id])
    authorize @bike
    @bike.destroy
    redirect_to bikes_path, status: :see_other
  end

  private

  def bike_params
    params.require(:bike).permit(:category, :status, :price_per_day, :address, :brand)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
