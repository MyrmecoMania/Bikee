class RentsController < ApplicationController
  before_action :set_rent, only: %i[edit update destroy]

  def new
    @rent = Rent.new
    authorize @rent
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.bike = Bike.find(params[:bike_id])
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
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @rent
    @rent.destroy
  end

  private

  def rent_params
    parmas.require(:rent).permit(:status, :start_date, :end_date)
  end

  def set_rent
    bike = Bike.find(params[:bike_id])
    @rent = bike.rent
  end
end
