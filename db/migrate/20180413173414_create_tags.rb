class CreateTags < ActiveRecord::Migration[5.1]
  def change
    drop_table :tags
    
    create_table :tags do |t|
      t.string :tagName
      t.text :description

      t.timestamps
    end
  end
end
