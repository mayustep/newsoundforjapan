class AddStartAtToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :start_at, :timestamp
  end
end
