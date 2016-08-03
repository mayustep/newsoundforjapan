class AddLogoNameToArtist < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :logo_uid, :string
    add_column :artists, :logo_name, :string
  end
end
