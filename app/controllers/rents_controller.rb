class RentsController < ApplicationController
  before_action :set_rent, only: %i[edit update destroy]

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.bike = Bike.find(params[:bike_id])
    if @rent.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @rent.update(rent_params)
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rent.destroy
  end

  private

  def rent_params
    parmas.require(:rent).permit(:total_price, :status, :start_date, :end_date, :user_id, :bike_id)
  end

  def set_rent
    bike = Bike.find(params[:bike_id])
    @rent = bike.rent
  end
end
