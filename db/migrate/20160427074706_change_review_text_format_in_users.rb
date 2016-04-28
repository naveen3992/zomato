class ChangeReviewTextFormatInUsers < ActiveRecord::Migration
  def up
  	change_column :users,:rowner,:boolean
  	change_column :reviews,:review_text,:text
  end

  def down
  end
end
