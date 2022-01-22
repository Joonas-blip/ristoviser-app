class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @collections = Collection.where(user_id: @user.id)
  end
end
