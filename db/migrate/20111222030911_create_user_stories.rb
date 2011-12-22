class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.references :project
      t.references :status, :default => 1
      t.timestamps
    end
    add_index :user_stories, :project_id
    add_index :user_stories, :status_id
  end
end
