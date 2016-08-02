class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :provider
      t.string :provider_id
      t.string :token
      t.integer :expires_at

      t.timestamps
    end
  end
end
