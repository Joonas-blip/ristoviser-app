class CollectionRestaurantsController < ApplicationController
  skip_before_action :authenticate_user! #remove after testing, problems with devise
  before_action :set_collection, only: :create


  def new
    @collection_restaurant = CollectionRestaurant.new
  end

  def create
    @collection_restaurant = CollectionRestaurant.new(collection_restaurant_params)
    @collection_restaurant.collection = @collection
    if @collection_restaurant.save
      redirect_to collection_path(@collection)
    else
      raise
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def collection_restaurant_params
    params.require(:collection_restaurant).permit(:restaurant_id)
  end
end
