class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.references :project
      t.references :status, :default => 1
      t.references :story_point
      t.timestamps
    end
    add_index :user_stories, :project_id
    add_index :user_stories, :status_id
    add_index :user_stories, :story_point_id
  end
end
