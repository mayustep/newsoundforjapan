class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.integer :translatable_id
      t.string :translatable_type
      t.string :translatable_field
      t.text :locale
      t.text :text

      t.timestamps
    end
  end
end
