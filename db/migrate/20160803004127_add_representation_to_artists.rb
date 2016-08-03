class AddRepresentationToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :representation_agreed_at, :timestamp
  end
end
