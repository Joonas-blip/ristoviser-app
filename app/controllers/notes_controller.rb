class NotesController < ApplicationController
  before_action :set_restaurant, :set_collection

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.restaurant = @restaurant
    if @note.save!
      redirect_to collection_path(@collection)
    else
      flash[:alert] = 'Error, please fill every field'
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_collection
    @collection = Collection.find(params[:format])
  end

  def note_params
    params.require(:note).permit(:content, :price, :rating)
  end
end
