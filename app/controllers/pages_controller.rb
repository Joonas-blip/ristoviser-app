class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :splash, :home ]

  def splash
  end

  def home
  end

end
