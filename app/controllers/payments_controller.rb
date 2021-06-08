class PaymentsController < ApplicationController
  def new
    @giftrequest = current_user.orders.where(state: 'pending').find(params[:gift_request_id])
  end
end
