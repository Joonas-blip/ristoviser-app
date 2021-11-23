class CollectionsController < ApplicationController
  before_action: set_collection, only: :show

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
    params.require(:collection).permit(:name, :public)
  end
end
