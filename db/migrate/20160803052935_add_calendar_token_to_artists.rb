class AddCalendarTokenToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :google_calendar_token, :string
  end
end
