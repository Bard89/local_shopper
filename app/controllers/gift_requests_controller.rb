class GiftRequestsController < ApplicationController

  def index
    @giftrequests = GiftRequest.all
  end

  def show
    @giftrequest = GiftRequest.find(params[:id])
  end

end
