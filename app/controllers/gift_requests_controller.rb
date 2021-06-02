class GiftRequestsController < ApplicationController
  def index
    @giftrequests = GiftRequest.all
  end


  def show
    @giftrequest = GiftRequest.find(params[:id])
    @review = Review.new
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
    
  def change_status
    @giftrequest = GiftRequest.find(params[:id])
    @giftrequest.update(status: params[:status])
    # if params[:status].present? && GiftRequest::STATUSES.include?(params[:status].to_sym)
    #   @giftrequest.update(status: params[:status])
    # end
    redirect_to dashboard_path, notice: "Status updated to #{@giftrequest.status}"
  end

  def accept
    @giftrequest = GiftRequest.find(params[:id])
    @giftrequest.update(status: params[:status])
    # if params[:status].present? && GiftRequest::STATUSES.include?(params[:status].to_sym)
    #   @giftrequest.update(status: params[:status])
    # end
    redirect_to gift_request_path(@giftrequest), notice: "You've succesfully taken on #{@giftrequest.requester.first_name}'s' gift request!"
  end

  private
  
  def giftrequest_params
    params.require(:gift_request).permit(:recipient_name, :recipient_address, :delivery_due_date, :budget, :packaging, :comment, :products, :status, :requester_id)
  end
end
