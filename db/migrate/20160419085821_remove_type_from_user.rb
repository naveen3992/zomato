class RemoveTypeFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :type
  end

  def down
  end
end
