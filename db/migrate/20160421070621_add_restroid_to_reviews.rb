class AddRestroidToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :restro_id, :integer
  end
end
