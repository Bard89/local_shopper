class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review
      t.boolean :requester_shopper
      t.references :gift_request

      t.timestamps
    end
  end
end
