class AddHotelLodgingToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :hotel_provided, :boolean
    add_column :bookings, :transportation_provided, :boolean
  end
end
