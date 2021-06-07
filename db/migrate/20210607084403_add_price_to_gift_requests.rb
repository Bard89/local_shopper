class AddPriceToGiftRequests < ActiveRecord::Migration[6.0]
  def change
    # add monitize -> method coming from money rails
    # remove the -- , currency: { present: false } -- for multiple currencies
    add_monetize :gift_requests, :price, currency: { present: false } # false means that I only have one currency, so I don't have to store it in the database

  end
end
