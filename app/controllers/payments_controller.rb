class PaymentsController < ApplicationController
  def new
    @giftrequest = GiftRequest.find(params[:gift_request_id])
    #@giftrequest = current_user.gift_requests.where(state: 'pending').find(params[:gift_request_id])
  end

end
