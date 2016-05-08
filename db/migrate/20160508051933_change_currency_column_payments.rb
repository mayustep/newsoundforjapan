class ChangeCurrencyColumnPayments < ActiveRecord::Migration[5.0]
  def change
    change_column(:payments, :currency, :string)
  end
end
