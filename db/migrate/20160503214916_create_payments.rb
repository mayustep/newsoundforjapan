class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :fund_id
      t.integer :user_id
      t.integer :amount
      t.integer :currency
      t.boolean :confirmed
      t.string :transaction_id

      t.timestamps
    end
  end
end
