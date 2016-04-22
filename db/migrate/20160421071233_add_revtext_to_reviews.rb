class AddRevtextToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :review_text, :string
  end
end
