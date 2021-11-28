class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user! #remove after testing, problems with devise

  def index
    @user = current_user
    @user_restaurants = CollectionRestaurant.where(collection: Collection.where(user: @user).pluck(:id)).pluck(:restaurant_id).map {|r| Restaurant.find(r) }.uniq
    # if params.has_key?("search")
    #   query = params["search"]["selection"]
    #   @user_restaurants = @user_restaurants.select { |restaurant| (restaurant.name.include?(query.downcase) || restaurant.address.include?(query.downcase)) }
    # end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @note = Note.find_by(user: current_user, restaurant: @restaurant)
    @note = Note.new unless @note
  end

  def find_restaurant
    @restaurants = Restaurants.all
  end
end
