class GiftRequestsController < ApplicationController
  def index
    @giftrequests = GiftRequest.all
    @opengiftrequests = GiftRequest.where(shopper_id: nil, status: "pending", recipient_address: current_user.location).order(created_at: :desc)
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

    if @giftrequest.save
      flash[:success] = "GiftRequest successfully created"
      redirect_to dashboard_path(confirm: true)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end

    #this works with the stripe, sends some data to stripe, so the stripe knows what the user is paying for ...
    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     #name: giftrequest.product1 # this needs to be pu into into an array? and put al the products there?, so the stripe knows for what all to pay
    #     # :product1 #, :shop1, :product2, :shop2, :product3, :shop3
    #     #images: [gift_request.photo_url],
    #     #amount: @gift_request.price_cents,
    #     #currency: 'eur',
    #     #quantity: 1 # we will always have 1, we don't have the option to change it, user would have to pick the same item multiple times
    #   }],
    #   success_url: order_url(order), # where to go after doing the payment
    #   cancel_url: order_url(order) # we wanna go to the showpage of the order
    # )

    # order.update(checkout_session_id: session.id)
    # redirect_to new_order_payment_path(order)
    # raise
  end

  def confirm

    @giftrequest = GiftRequest.new(giftrequest_params)
    @giftrequest.requester = current_user

    unless @giftrequest.valid?
    render :action => :new
    else
    end

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
