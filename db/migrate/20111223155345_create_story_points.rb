class CreateStoryPoints < ActiveRecord::Migration
  def change
    create_table :story_points do |t|
      t.string :value

      t.timestamps
    end
  end
end
