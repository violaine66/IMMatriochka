class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)

    @message.user = current_user
    @message.chatroom = @chatroom

    if @message.save
      # Broadcast the message to the chatroom channel
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "messages/message", locals: { message: @message })
      )
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end
  private
  def message_params
    params.require(:message).permit(:contenu)
  end
end
