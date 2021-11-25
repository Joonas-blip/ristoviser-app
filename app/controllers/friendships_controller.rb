class FriendshipsController < ApplicationController

  def new
    @friendship = Friendship.new
    if params.has_key?("search")
      user = params["search"]["selection"]
      @users = User.where("first_name ILIKE ?", "%#{user}%")
    else
      @users = User.all
    end
  end

  def create
    @friendship_asker = Friendship.create(user: current_user, friend: params[:format])
    @friendhip_receiver = Friendship.create(user: params[:format], friend: current_user)
  end

  def confirm_friendship; end
end