class PaymentsController < ApplicationController
  def new
    @giftrequest = GiftRequest.find(params[:gift_request_id])
    #raise
    #@giftrequest = current_user.gift_requests.where(state: 'pending').find(params[:gift_request_id])
  end

end
