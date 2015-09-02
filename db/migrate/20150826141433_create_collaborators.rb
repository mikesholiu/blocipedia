class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :wiki_id
      t.integer :user_id
    end

    add_index :collaborators, :id, unique: true
    add_index :collaborators, :wiki_id
    add_index :collaborators, :user_id
  end

 

end

# wiki.users << user
# wiki.users.save\\

# rails gmigration create_users_wikis users_wikis