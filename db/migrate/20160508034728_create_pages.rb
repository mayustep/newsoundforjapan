class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages, :id => false do |t|
      t.string :id

      t.timestamps
    end
  end
end
