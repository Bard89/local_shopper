class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to gift_request_chatrooms_path(params[:message][:gift_request_id], anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: { message: @message })
    )
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
