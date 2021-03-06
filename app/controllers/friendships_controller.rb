class FriendshipsController < ApplicationController

  def new
    @current_user = current_user
    @friendship = Friendship.new
    if params.has_key?("search")
      user = params["search"]["search"]
      @users = User.where("lower(first_name) ILIKE ? AND id != #{@current_user.id}", "%#{user.downcase}%")
    else
      @users = User.where.not(id: @current_user.id)
    end
  end

  def create
    @friendship = Friendship.new(asker: current_user, receiver: User.find(params[:user]))
    unless @friendship.save
      flash[:alert] = "User doesn't exist"
      render :new
    end
    redirect_to new_friendship_path
    flash[:notice] = "Friend request sent!"
  end

  def confirm
    friendship = current_user.friendships_as_receiver.find_by(asker: User.find(params[:id]))
    friendship.status = 'confirmed'
    unless friendship.save
      flash[:alert] = "Something went wrong"
      render :new
    end
    redirect_to '/dashboards/friends'
  end
end
