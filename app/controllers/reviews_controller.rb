class ReviewsController < ApplicationController
  def create
      @gift_request = Giftrequest.find(params[:gift_request_id])
      @review = Review.new(review_params)
      @review.gift_request = @gift_request
      if @review.save
        redirect_to gift_request_path(@gift_request)
      else
        render "gift_requests/show"
      end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :review)
  end

  def review_permitted
    @review.requester_shopper = true if current_id == @gift_request.shopper_id || current_id == @gift_request.requester_id
  end
end

# check if the current user ID matches the shopper_id or requester_id for that gift_request
# if yes, allow them to create a review
# asign the created review to the ID of the other ID in the request that is not theirs
