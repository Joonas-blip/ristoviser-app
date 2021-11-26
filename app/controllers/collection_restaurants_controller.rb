class CollectionRestaurantsController < ApplicationController
  skip_before_action :authenticate_user! #remove after testing, problems with devise
  before_action :set_collection, only: :new

  def new
    @collection_restaurant = CollectionRestaurant.new
    if params.has_key?("search")
      restaurant = params["search"]["selection"]
      @restaurants = Restaurant.where("name ILIKE ?", "%#{restaurant}%")

        if @restaurants.count == 0
          search_result = query_api(restaurant)
          search_result.each do |result|
            restaurant = Restaurant.new(name: result['name'], address: result['formatted_address'])
            restaurant.save!
          end
        end
    else
      @restaurants = Restaurant.all
    end
  end

  def create
    collection = Collection.find(params[:collection_id])
    restaurant = Restaurant.find(params[:format])
    @collection_restaurant = CollectionRestaurant.new(collection: collection, restaurant: restaurant)
    if Note.where("user_id = #{current_user.id} AND restaurant_id = #{restaurant.id}").exists?
      @collection_restaurant.save!
      redirect_to collection_path(collection)
    else
      redirect_to new_restaurant_note_path(restaurant, collection.id)
      @collection_restaurant.save!
    end
  end

  private

  def query_api(restaurant)
    base_url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input="
    query = restaurant.split
    query = query.join('%20')
    url = URI("#{base_url}#{query}&inputtype=textquery&fields=formatted_address%2Cname&key=AIzaSyC2Ck1pMVEYNxiPnnhDxY6iaQUV5SBmoZg")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    data = response.body
    result = JSON.parse(data)
    result['candidates']
  end

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def collection_restaurant_params
  end
end
