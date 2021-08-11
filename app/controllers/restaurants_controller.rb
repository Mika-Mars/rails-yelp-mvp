class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_url(@restaurant.id)
    else
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
