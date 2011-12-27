class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :project
      t.references :user

      t.timestamps
    end
    add_index :memberships, :project_id
    add_index :memberships, :user_id
  end
end
