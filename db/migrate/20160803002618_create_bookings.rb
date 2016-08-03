class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :booker_id
      t.integer :bookee_id
      t.integer :price
      t.string :currency
      t.timestamp :bookee_confirmed_at
      t.timestamp :booker_confirmed_at

      t.timestamps
    end
  end
end
