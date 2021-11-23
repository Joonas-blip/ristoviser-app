class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
    @note = Note.find_by(user: current_user, restaurant: @restaurant)
  end

end
