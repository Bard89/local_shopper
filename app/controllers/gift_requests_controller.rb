class GiftRequestsController < ApplicationController
  def index
    @giftrequests = GiftRequest.all
    @opengiftrequests = GiftRequest.near(current_user.location, 10).where(shopper_id: nil, status: "pending").order(created_at: :desc)
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude
    @markers = @opengiftrequests.geocoded.map do |opengiftrequest|
      {
      lat: opengiftrequest.latitude,
      lng: opengiftrequest.longitude,
      info_window: render_to_string(partial: "profiles/info_window", locals: {opengiftrequest: opengiftrequest})
      }
    end
  end

  def show
    @giftrequest = GiftRequest.find(params[:id])
    @review = Review.new
    # already created since I have the gift request which is an order of sorts
    # order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)
    # raise
    # this works with the stripe, sends some data to stripe, so the stripe knows what the user is paying for ... some of it will be on the receipt then
  end

  def new
    @giftrequest = GiftRequest.new
    @chatroom = Chatroom.new # now added, should it be here? ...

  end

  def create
    @giftrequest = GiftRequest.new(giftrequest_params)
    @giftrequest.requester = current_user
    #raise
    if @giftrequest.save
      flash[:success] = "GiftRequest successfully created"
      redirect_to dashboard_path(confirm: true)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
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
    @giftrequest.update(status: "accepted")
    @giftrequest.update(shopper: current_user)
    @chatroom = Chatroom.create(gift_request_id: @giftrequest.id) # I create the chatroom on accepting the request by the other user (need 2 users for that)
    # was not working before as it was Chatroom.new instead of Chatroom.create
    redirect_to root_path, notice: "You've succesfully taken on #{@giftrequest.requester.first_name}'s gift request!"
  end

  def gift_price
    @giftrequest = GiftRequest.find(params[:id])
    @giftrequest.update(price_cents: price_params)
    @giftrequest.update(status: "purchased")
    @giftrequest.price = params[:gift_request][:price].to_i
    if @giftrequest.update_attributes(price_params)
      redirect_to gift_request_path(@giftrequest)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def giftrequest_params
    params.require(:gift_request).permit(:recipient_name, :recipient_address, :delivery_due_date, :budget, :price_cents, :packaging, :comment, :status, :requester_id, :product1, :shop1, :product2, :shop2, :product3, :shop3, :price_cents)
  end

  def price_params
    params.require(:gift_request).permit(:price_cents)
  end
end
