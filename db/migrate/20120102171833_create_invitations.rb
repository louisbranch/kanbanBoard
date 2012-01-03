class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :user
      t.references :project
      t.string :email

      t.timestamps
    end
    add_index :invitations, :user_id
    add_index :invitations, :project_id
  end
end
