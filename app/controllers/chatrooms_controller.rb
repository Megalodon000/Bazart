class ChatroomsController < ApplicationController
    def show
        @chatroom = Chatroom.find(params[:id])
        @message = Message.new
<<<<<<< HEAD
      end
=======
    end
>>>>>>> e37754df70e9b768f1c8ce16fa7e90a53f6cb274
end
