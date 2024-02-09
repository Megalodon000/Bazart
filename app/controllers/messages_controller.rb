class MessagesController < ApplicationController
    def create
        @chatroom = Chatroom.find(params[:chatroom_id])
        @message = Message.new(message_params)
        @message.chatroom = @chatroom
        @message.user = current_user
<<<<<<< HEAD
       if @message.save
            ChatroomChannel.broadcast_to(
                @chatroom,
                render_to_string(partial: "message", locals: {message: @message})
            )
            head :ok
       end
    end 
    
private
=======
        
        @message.save
        ChatroomChannel.broadcast_to(
          @chatroom,
          render_to_string(
            partial: "messages/message", 
            locals: { message: @message }
          )
        )
        head :ok
      end
    
    private
>>>>>>> e37754df70e9b768f1c8ce16fa7e90a53f6cb274

    def message_params
    params.require(:message).permit(:content)
    end
end
