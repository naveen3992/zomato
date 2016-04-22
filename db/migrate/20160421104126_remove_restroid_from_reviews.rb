class RemoveRestroidFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :restro_id
  end

end
