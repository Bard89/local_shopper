class AddCheckoutToGiftRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :gift_requests, :checkout_session_id, :string
  end
end
