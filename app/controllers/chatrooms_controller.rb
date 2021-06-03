class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(gift_request_id: params[:gift_request_id])
    @message = Message.new
  end

  # create action, user clicks on the buttom, read the params and create the chatroom

  # def create
  #   # @chatroom = Chatroom.create(gift_request_id: current_user.)
  # end
end
