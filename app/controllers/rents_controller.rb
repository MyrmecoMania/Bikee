class RentsController < ApplicationController
  before_action :set_bike, only: %i[new create edit update destroy]
  before_action :set_rent, only: %i[edit update]

  def new
    @rent = Rent.new(bike_id: @bike.id)
    authorize @rent
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.bike = @bike
    @rent.status = true # l'ajouter dans le model rent par default
    authorize @rent
    if @rent.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @rent
  end

  def update
    authorize @rent
    if @rent.update(rent_params)
      redirect_to dashboard_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @rent
    @rent.destroy
  end

  private

  def rent_params
    params.require(:rent).permit(:status, :start_date, :end_date)
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def set_rent
    @rent = Rent.find(params[:id])
  end
end
