class DropCalendarApps < ActiveRecord::Migration[5.1]
  def change
    drop_table :calendar_apps
  end
end
