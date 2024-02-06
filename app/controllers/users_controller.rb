class UsersController < ApplicationController
  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
      }
    end
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
