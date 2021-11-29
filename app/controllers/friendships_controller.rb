class FriendshipsController < ApplicationController

  def new
    @current_user = current_user
    @friendship = Friendship.new
    if params.has_key?("search")
      user = params["search"]["selection"]
      @users = User.where("first_name ILIKE ? AND id != #{@current_user.id}", "%#{user}%")
    else
      @users = User.where("id != #{@current_user.id}")
    end
  end

  def create
    @friendship_asker = Friendship.new(user: current_user, friend_id: params[:format])
    @friendship_asker.save!
    @friendship_receiver = Friendship.new(user: User.find(params[:format]), friend_id: current_user.id)
    @friendship_receiver.save!
  end

  def confirm
    receiving_friend = current_user.friendships.find_by(friend_id: params[:id])
    receiving_friend.status = 'confirmed'
    receiving_friend.save!
    sending_friend = User.find(params[:id]).friendships.find_by(friend_id: current_user.id)
    sending_friend.status = 'confirmed'
    sending_friend.save!
    redirect_to '/dashboards/friends'
  end
end
