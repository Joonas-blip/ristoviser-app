class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    @note = Note.find_by(user: current_user, restaurant: @restaurant)
    @note = Note.new unless @note
  end

  def find_restaurant
    @restaurants = Restaurants.all
  end
end
