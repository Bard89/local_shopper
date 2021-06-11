class PaymentsController < ApplicationController
  def new
    @giftrequest = GiftRequest.find(params[:gift_request_id])

    #@giftrequest = GiftRequest.find(params[:id])
    if @giftrequest.shopper && @giftrequest.price_cents
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        # we are passing an array of hashes, each hash represents one order/ one gift in out case
        # do some if statemnt to check id there are more than one gifts
        line_items: [{
          name: "gift", # maybe not rigt for the financial sevices, but let's not list the products
          # images: [gift_request.photo_url],
          amount: @giftrequest.price_cents, # this can't be 0 here
          currency: 'eur',
          # description: @giftrequest.comment,
          quantity: 1 # we will always have 1, we don't have the option to change it, user would have to pick the same item multiple times
        }],
        # problem here is that we only have the price as a whole
        # {name: @giftrequest.product2,},
        # {}],
        success_url: gift_request_url(@giftrequest), # where to go after doing the payment
        cancel_url: gift_request_url(@giftrequest) # we wanna go to the showpage of the order
      )

      @giftrequest.update(checkout_session_id: session.id)
      #redirect_to new_gift_request_payment_path(@giftrequest)
      @giftrequest.update(status: "payment pending") # here it's just being processed by stripe, should be pending
    end
  end
end
