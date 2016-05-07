class AddImageToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :image_name, :string
    add_column :goals, :image_uid, :string
  end
end
