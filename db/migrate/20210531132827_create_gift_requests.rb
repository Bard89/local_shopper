class CreateGiftRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :gift_requests do |t|
      t.string :recipient_name
      t.string :recipient_address
      t.date :delivery_due_date
      t.integer :budget
      t.string :packaging
      t.text :comment
      t.string :products
      t.string :status
      t.integer :requester_id, index: true
      t.integer :shopper_id, index: true

      t.timestamps
    end
  end
end
