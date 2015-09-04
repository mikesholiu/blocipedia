class AddCreatorToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :creator, :string
  end
end
