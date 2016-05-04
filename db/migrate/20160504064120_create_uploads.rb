class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.integer :user_id
      t.string :file_name
      t.string :file_uid
      t.string :mime_type
      t.string :through
      t.integer :bytes
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end
  end
end
