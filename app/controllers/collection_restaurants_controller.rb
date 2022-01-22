class CollectionRestaurantsController < ApplicationController
  skip_before_action :authenticate_user! #remove after testing, problems with devise
  before_action :set_collection, only: :new

  def new
    @collection_restaurant = CollectionRestaurant.new
    if params.has_key?("search")
      restaurant = params["search"]["selection"]
      @restaurants = Restaurant.where("name ILIKE ?", "%#{restaurant}%")

        if @restaurants.count == 0
          @restaurants = []
          search_result = Restaurant.query_api(restaurant)
          search_result.each do |result|
            photo = Restaurant.retrieve_photo(result)
            restaurant = Restaurant.new(name: result['name'], address: result['formatted_address'], photo: photo)
            restaurant.save
            @restaurants << restaurant
          end
          @restaurants
        end
    else
      @restaurants = Restaurant.all
    end
  end

  def create
    collection = Collection.find(params[:collection_id])
    restaurant = Restaurant.find(params[:format])
    @collection_restaurant = CollectionRestaurant.new(collection: collection, restaurant: restaurant)
    if Note.where(user_id: current_user.id, restaurant_id: restaurant.id).exists?
      @collection_restaurant.save
      redirect_to collection_path(collection)
    else
      redirect_to new_restaurant_note_path(restaurant, collection.id)
      @collection_restaurant.save
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def collection_restaurant_params
  end
end
