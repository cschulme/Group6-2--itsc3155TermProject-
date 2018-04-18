class CreateCalendarViews < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_views do |t|
      t.date :dateInUse

      t.timestamps
    end
  end
end
