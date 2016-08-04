class CreateUserRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_relations do |t|
      t.integer :user_id
      t.integer :relative_id
      t.string :relative_type
      t.string :relation

      t.timestamps
    end
  end
end
