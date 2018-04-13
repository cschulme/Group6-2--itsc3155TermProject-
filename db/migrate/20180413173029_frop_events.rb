class FropEvents < ActiveRecord::Migration[5.1]
  def change
    drop_table :events
    drop_table :tags
  end
end
