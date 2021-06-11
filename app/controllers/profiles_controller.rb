class ProfilesController < ApplicationController
  # displaying info about specific user
  def show # just to see differentu user not me, for me I pu it in the dashboard anf for that then use different controller
    # @my_user = current_user # for this do the dashboard controller
    @user = User.find(params[:id]) # to find a specific user
    @gift_requests = GiftRequest.where(shopper_id: @user) # possible to rename to requester_id or shopper_id
    @reviews = Review.where(gift_request_id: @gift_requests).order(created_at: :desc)
  end

  def dashboard
    # @giftrequest = GiftRequest.find(params[:id])
    # @reviews = Review.new
    @giftrequests = GiftRequest.where(requester_id: current_user).order(updated_at: :desc)
    @mygiftrequests = GiftRequest.where(shopper_id: current_user).order(updated_at: :desc)
    if params[:confirm]
      flash[:notice] = "Your Request has been succecfully made"
    end

    # @chatrooms = Chatroom.where(gift_request: @giftrequest)

    # @opengiftrequests = GiftRequest.near(current_user.location, 10).where(shopper_id: nil, status: "pending").order(created_at: :desc)
    # @markers = @opengiftrequests.geocoded.map do |opengiftrequest|
    #   {
    #   lat: opengiftrequest.latitude,
    #   lng: opengiftrequest.longitude,
    #   info_window: render_to_string(partial: "info_window", locals: {opengiftrequest: opengiftrequest})
    #   }
    # end
  end

  def shopper_dashboard
    @giftrequests = GiftRequest.where(shopper_id: current_user).order(created_at: :desc)
  end

end
