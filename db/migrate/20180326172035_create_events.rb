class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :eventInformation
      t.date :eventDate
      t.time :startTime
      t.time :endTime
      t.integer :tag

      t.timestamps
    end
    
    create_table :tags do |t|
      t.string :tagName
      
      t.timestamps
    end
  end
end
