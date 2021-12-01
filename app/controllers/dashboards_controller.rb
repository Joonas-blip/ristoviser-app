class DashboardsController < ApplicationController

  def index
    @user = current_user
  end

  def friends
    @friends = current_user.friends
  end

  def pending
    @friends = Friendship.of_status_pending(current_user)
  end
end
