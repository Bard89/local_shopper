class ProfilesController < ApplicationController
  # displaying info about specific user
  def show # just to see differentu user not me, for me I pu it in the dashboard anf for that then use different controller
    # @my_user = current_user # for this do the dashboard controller
    @user = User.find(params[:id]) # to find a specific user
    @gift_requests = GiftRequest.where(requester_id: @user) # possible to rename to requester_id or shopper_id
  end

  def dashboard
    @giftrequests = GiftRequest.where(requester_id: current_user).order(updated_at: :desc)
    # @chatrooms = Chatroom.where(gift_request: @giftrequest)
    # raise
  end
end
