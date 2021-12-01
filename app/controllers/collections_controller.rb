class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show]
  skip_before_action :authenticate_user!, only: :map

  def index
    @user = current_user
    @collections = Collection.where("user_id = #{@user.id}")
  end

  def show
    @restaurants = @collection.restaurants
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { restaurant: restaurant })
      }
    end
  end

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

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :public, :photo)
  end
end
