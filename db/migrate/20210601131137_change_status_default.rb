class ChangeStatusDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:gift_requests, :status, 'pending')
  end
end
