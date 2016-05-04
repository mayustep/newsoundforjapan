class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :amount
      t.string :currency
      t.string :name
      t.integer :fund_id
      t.integer :position

      t.timestamps
    end
  end
end
