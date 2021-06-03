class ChangeProductsColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :gift_requests, :products, :text
    add_column :gift_requests, :product1, :string
    add_column :gift_requests, :product2, :string
    add_column :gift_requests, :product3, :string
    add_column :gift_requests, :shop1, :string
    add_column :gift_requests, :shop2, :string
    add_column :gift_requests, :shop3, :string
  end
end
