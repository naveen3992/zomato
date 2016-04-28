class AddRownerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rowner, :boolean
  end
end
