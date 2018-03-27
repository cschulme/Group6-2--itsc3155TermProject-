class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :eventInformation
      t.datetime :startTime
      t.datetime :endTime
      t.integer :tag

      t.timestamps
    end
  end
end
