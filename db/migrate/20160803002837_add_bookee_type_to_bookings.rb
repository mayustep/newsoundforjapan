class AddBookeeTypeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :bookee_type, :string
  end
end
