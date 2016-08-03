class AddImageNameToArtist < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :image_name, :string
  end
end
