class UsersController < ApplicationController
  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
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
    @chatroom = Chatroom.find_by(artisan_id: @user.id, client_id: current_user.id)
    @message = Message.new
      if @chatroom.nil?
        @chatroom = Chatroom.create(artisan_id: @user.id, client_id: current_user.id)
      end
  end


end
