class AddCalendarIdToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :google_calendar_id, :string
  end
end
