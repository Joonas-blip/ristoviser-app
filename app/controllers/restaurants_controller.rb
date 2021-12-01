class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user! #remove after testing, problems with devise

  def index
    @user = current_user
    @user_restaurants = CollectionRestaurant.where(collection: Collection.where(user: @user).pluck(:id)).pluck(:restaurant_id).map {|r| Restaurant.find(r) }.uniq
    if params.has_key?("search")
      query = params["search"]["Search"]
      pattern = /\A#{query.downcase}.*|\s#{query.downcase}.*/
      @user_restaurants = @user_restaurants.select { |restaurant| restaurant.name.downcase =~ pattern || restaurant.address.downcase =~ pattern }
    end
    @markers = @user_restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { restaurant: restaurant })
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @note = Note.find_by(user: params[:friend_id], restaurant: @restaurant)
    @note = Note.new unless @note
  end

  def find_restaurant
    @restaurants = Restaurants.all
  end
end
