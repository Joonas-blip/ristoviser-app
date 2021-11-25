class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :map]
  skip_before_action :authenticate_user!, only: :map

  def index
    @collections = Collection.all
  end

  def show; end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    if @collection.save!
      flash[:notice] = 'Collection successfully created!'
      redirect_to collection_path(@collection)
    else
      flash[:alert] = 'Error, please fill every field'
      render :new
    end
  end

  def map
    @restaurants = @collection.restaurants

    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def collection_params
    params.require(:collection).permit(:name, :public)
  end
end
