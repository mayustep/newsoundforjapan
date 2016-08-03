class AddImageUidToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :image_uid, :string
  end
end
