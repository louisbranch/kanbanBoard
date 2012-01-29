class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description
      t.references :user_story

      t.timestamps
    end
    add_index :issues, :user_story_id
  end
end
