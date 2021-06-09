class ReviewsController < ApplicationController
  def create
    @gift_request = GiftRequest.find(params[:gift_request_id])
    @review = Review.new(review_params)
    @review.gift_request = @gift_request
    if @review.save
      redirect_to gift_request_path(@gift_request)
      # redirect_to profile_path(@gift_request.shopper)
    else
      render "gift_requests/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :review)
  end
end

# check if the current user ID matches the shopper_id or requester_id for that gift_request
# if yes, allow them to create a review
# asign the created review to the ID of the other ID in the request that is not theirs
