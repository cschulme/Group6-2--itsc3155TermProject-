class AddTagDescriptionToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :tagDescription, :text
  end
end
