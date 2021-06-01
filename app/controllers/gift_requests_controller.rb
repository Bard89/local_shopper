class GiftRequestsController < ApplicationController

  def index
    @giftrequests = GiftRequest.all
  end

  def new
    @giftrequest = GiftRequest.new
  end
  
  def create
    @giftrequest = GiftRequest.new(giftrequest_params)
    @giftrequest.requester = current_user
    if @giftrequest.save
      flash[:success] = "GiftRequest successfully created"
      redirect_to my_requests_gift_requests_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @giftrequest = GiftRequest.find(params[:id])
  end

  def update
    @giftrequest = GiftRequest.find(params[:id])
      if @giftrequest.update_attributes(giftrequest_params)
        flash[:success] = "GiftRequest was successfully updated"
        redirect_to my_requests_gift_requests_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  private

  def giftrequest_params
    params.require(:gift_request).permit(:recipient_name, :recipient_address, :delivery_due_date, :budget, :packaging, :comment, :products, :status, :requester_id)
  end
  
end
