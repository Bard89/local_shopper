class ProfilesController < ApplicationController
  # displaying info about specific user
  def show # just to see differentu user not me, for me I pu it in the dashboard anf for that then use different controller
    # @my_user = current_user # for this do the dashboard controller
    @user = User.find(params[:id]) # to find a specific user
    @gift_requests = GiftRequest.where(requester_id: @user) # possible to rename to requester_id or shopper_id
  end

  def dashboard
    @giftrequests = GiftRequest.where(requester_id: current_user).order(created_at: :asc)
  end

  # I don't really need this to be separate methods, it's ok have them

  # def my_gift_requests # profiles controller
  #   @gift_requests = GiftRequest.where(user_id: current_user)
  # end

  # def my_gift_requests # rename to see other users
  #   @gift_requests = GiftRequest.where(user_id: @user) # rename  requester_id or shopper_id
  # end
end
