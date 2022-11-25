class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  before_action :set_new_bike

  def home
  end

  def dashboard
  end

  private

  def set_new_bike
    @new_bike = Bike.new
  end
end
