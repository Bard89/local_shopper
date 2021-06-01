class GiftRequestsController < ApplicationController

  def index
    @giftrequests = GiftRequest.all
  end

end
