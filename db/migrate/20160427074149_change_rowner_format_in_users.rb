class ChangeRownerFormatInUsers < ActiveRecord::Migration
  def up
  	change_column :users ,:rowner ,:text
  end

  def down
  	change_column :users ,:rowner, :boolean
  end
end
