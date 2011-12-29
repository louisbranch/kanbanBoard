class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.references :project
      t.references :status
      t.references :story_size
      t.timestamps
    end
    add_index :user_stories, :project_id
    add_index :user_stories, :status_id
    add_index :user_stories, :story_size_id
  end
end
