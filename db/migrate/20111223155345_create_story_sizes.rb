class CreateStorySizes < ActiveRecord::Migration
  def change
    create_table :story_sizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
