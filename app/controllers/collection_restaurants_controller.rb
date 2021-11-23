class CollectionRestaurantsController < ApplicationController
  before_action :set_collection

  def new
    @collection_restaurant = Collection_restaurant.new
  end

  def create
    @collection_restaurant = Collection_restaurant.new(collection_restaurant_params)
    @collection_restaurant.collection = @collection
    if @collection_restaurant.save
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def collection_restaurant_params
    params.require(collection_restaurant).permit(:restaurant)
  end
end
