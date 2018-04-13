class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :eventInformation
      t.date :eventDate
      t.time :startTime
      t.time :endTime
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
