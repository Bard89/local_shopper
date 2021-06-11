# this is what I'm creating when i call the event checkout, can be called whenever I want
class StripeCheckoutSessionService
  def call(event) #
    @giftrequest = GiftRequest.find_by(checkout_session_id: event.data.object.id)
    @giftrequest.update(status: 'paid')
  end
end
