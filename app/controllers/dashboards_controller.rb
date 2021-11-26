class DashboardsController < ApplicationController

  def index
   @user = current_user
  end

  def friends
    @friendships = Friendship.all
    @friends = Friendship.of_status(current_user, "confirmed")
  end

  def pending
    @friendships = Friendship.all
    @friends = Friendship.of_status(current_user, "pending")
  end
end
