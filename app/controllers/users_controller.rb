class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @markers = @user.geocode
    @markers = [{
      lat: @user.latitude,
      lng: @user.longitude
    }]
  end

end
