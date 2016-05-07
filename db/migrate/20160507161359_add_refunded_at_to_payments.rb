class AddRefundedAtToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :refunded_at, :timestamp
  end
end
