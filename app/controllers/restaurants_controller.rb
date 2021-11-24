class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user! #remove after testing, problems with devise

  def show
    @restaurant = Restaurant.find(params[:id])
    @note = Note.find_by(user: current_user, restaurant: @restaurant)
  end

  def find_restaurant
    @restaurants = Restaurants.all
  end
end
