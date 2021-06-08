class AddCoordinatesToGiftRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :gift_requests, :latitude, :float
    add_column :gift_requests, :longitude, :float
  end
end
