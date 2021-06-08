class ProfilesController < ApplicationController
  # displaying info about specific user
  def show # just to see differentu user not me, for me I pu it in the dashboard anf for that then use different controller
    # @my_user = current_user # for this do the dashboard controller
    @user = User.find(params[:id]) # to find a specific user
    @gift_requests = GiftRequest.where(shopper_id: @user) # possible to rename to requester_id or shopper_id
    @reviews = Review.where(gift_request_id: @gift_requests).order(created_at: :desc)
  end

  def dashboard
    @giftrequests = GiftRequest.where(requester_id: current_user).order(created_at: :desc)
    @opengiftrequests = GiftRequest.where(shopper_id: nil, status: "pending", recipient_address: current_user.location).order(created_at: :desc)

    if params[:confirm]
      flash[:notice] = "Your Request has been succecfully made"
    end
    # @chatrooms = Chatroom.where(gift_request: @giftrequest)
  end
  # the stripe should be here
  def shopper_dashboard
    @giftrequests = GiftRequest.where(shopper_id: current_user).order(created_at: :desc)
  end

end
