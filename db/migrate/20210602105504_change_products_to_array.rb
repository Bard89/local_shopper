class ChangeProductsToArray < ActiveRecord::Migration[6.0]
  def change
    remove_column :gift_requests, :products
    add_column :gift_requests, :products, :text, array: true, default: []
  end
end
