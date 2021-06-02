class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    raise
  end

  # create action, user clicks on the buttom, read the params and create the chatroom

  def create
    # @chatroom = Chatroom.create(gift_request_id: current_user.)
  end


  # def create
  #   @giftrequest = GiftRequest.new(giftrequest_params)
  #   @giftrequest.requester = current_user
  #   if @giftrequest.save
  #     flash[:success] = "GiftRequest successfully created"
  #     redirect_to my_requests_gift_requests_path
  #   else
  #     flash[:error] = "Something went wrong"
  #     render 'new'
  #   end
  # end

end
