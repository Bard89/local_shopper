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

    # moved to the accept action controller ....
    # add create chatroom and assign the newly created chatroom to the gift request
    # @chatroom = Chatroom.new(gift_request_id:@giftrequest.id)
    # @giftrequest.chatroom = @chatroom # reduntant

    if @giftrequest.save
      flash[:success] = "GiftRequest successfully created"
      redirect_to dashboard_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end



  end

  # modify !!!! merge with the create controller?
  def create_payment # to kinda add payment details to the already created gift_request

    gift = GiftRequest.find(params[:id])
    order  = GiftRequest.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)
    # this works with the stripe
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: gift.sku,
        images: [gift.photo_url],
        amount: gift.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order), # where to go after doing the payment
      cancel_url: order_url(order) # we wanna go to the showpage of the order
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def edit
    @giftrequest = GiftRequest.find(params[:id])
  end

  def update # will also use for the what I added from stripe ...
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
    redirect_to dashboard_path, notice: "Status for #{@giftrequest.recipient_name}'s gift updated to #{@giftrequest.status}"
  end

  def shopper_change_status
    @giftrequest = GiftRequest.find(params[:id])
    @giftrequest.update(status: params[:status])
    # if params[:status].present? && GiftRequest::STATUSES.include?(params[:status].to_sym)
    #   @giftrequest.update(status: params[:status])
    # end
    redirect_to shopper_dashboard_path, notice: "Status for #{@giftrequest.recipient_name}'s gift updated to #{@giftrequest.status}"
  end

  def accept
    @giftrequest = GiftRequest.find(params[:id])
    @giftrequest.update(status: params[:status])
    @giftrequest.update(shopper: current_user)
    @chatroom = Chatroom.create(gift_request_id: @giftrequest.id) # I create the chatroom on accepting the request by the other user (need 2 users for that)
    # was not working before as it was Chatroom.new instead of Chatroom.create
    redirect_to gift_request_path(@giftrequest), notice: "You've succesfully taken on #{@giftrequest.requester.first_name}'s' gift request!"
  end

  private
  
  def giftrequest_params
    params.require(:gift_request).permit(:recipient_name, :recipient_address, :delivery_due_date, :budget, :price_cents, :packaging, :comment, :status, :requester_id, :product1, :shop1, :product2, :shop2, :product3, :shop3)
  end
end
