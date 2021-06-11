class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      current_user_messages = render_to_string(partial: "messages/current_user", locals: { message: @message })
      other_user_messages = render_to_string(partial: "messages/other_user", locals: { message: @message })
      ChatroomChannel.broadcast_to(
        @chatroom,
        current_user_messages: current_user_messages,
        other_user_messages: other_user_messages,
        message: @message
      )
      redirect_to gift_request_chatrooms_path(params[:message][:gift_request_id], anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
