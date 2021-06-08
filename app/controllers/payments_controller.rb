class PaymentsController < ApplicationController
  def new
    @giftrequest = GiftRequest.find(params[:gift_request_id])
  end
end
