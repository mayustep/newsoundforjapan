class AddSponsoringInfoToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :image_name, :string
    add_column :payments, :image_uid, :string
    add_column :payments, :url, :string
  end
end
