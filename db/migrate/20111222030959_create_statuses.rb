class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :wip
      t.references :project
      t.timestamps
    end
    add_index :statuses, :project_id
  end
end

