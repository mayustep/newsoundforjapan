class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :topicable_id
      t.string :topicable_type
      t.text :text
      t.string :sender_email
      t.integer :sender_id
      t.string :sender_type

      t.timestamps
    end
  end
end
