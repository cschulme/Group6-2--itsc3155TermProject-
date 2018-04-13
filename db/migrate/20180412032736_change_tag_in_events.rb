class ChangeTagInEvents < ActiveRecord::Migration[5.1]
  def change
      remove_column :events, :tag
      add_reference :events, :tag, index: true
  end
end
