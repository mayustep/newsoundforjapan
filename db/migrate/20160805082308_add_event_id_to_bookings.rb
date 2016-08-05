class AddEventIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :event_id, :integer
  end
end
