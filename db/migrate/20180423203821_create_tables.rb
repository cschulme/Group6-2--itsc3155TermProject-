class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_views do |t|
      t.date :dateInUse

      t.timestamps
    end
    
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
    
    create_table :tags do |t|
      t.string :tagName
      t.text :description

      t.timestamps
    end
  end
end
