class GiftRequestsController < ApplicationController
  def index
    @giftrequests = GiftRequest.all
  end


  def show
    @giftrequest = GiftRequest.find(params[:id])
    @review = Review.new
    # raise
  end


  def new
    @giftrequest = GiftRequest.new
    @chatroom = Chatroom.new # now added, should it be here? ...
  end

  def create
    @giftrequest = GiftRequest.new(giftrequest_params)
    @giftrequest.requester = current_user

    # add create chatroom and assign the newly created chatroom to the gift request
    @chatroom = Chatroom.new(gift_request_id:@giftrequest.id)
    @giftrequest.chatroom = @chatroom

    if @giftrequest.save
      flash[:success] = "GiftRequest successfully created"
      redirect_to dashboard_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
    # raise
  end

  def edit
    @giftrequest = GiftRequest.find(params[:id])
  end

  def update
    @giftrequest = GiftRequest.find(params[:id])
    if @giftrequest.update_attributes(giftrequest_params)
      flash[:success] = "GiftRequest was successfully updated"
      redirect_to dashboard_path
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
    @giftrequest.update(shopper: current_user)
    redirect_to gift_request_path(@giftrequest), notice: "You've succesfully taken on #{@giftrequest.requester.first_name}'s' gift request!"
  end

  private
  
  def giftrequest_params
    params.require(:gift_request).permit(:recipient_name, :recipient_address, :delivery_due_date, :budget, :packaging, :comment, :status, :requester_id, :product1, :shop1, :product2, :shop2, :product3, :shop3)
  end
end
