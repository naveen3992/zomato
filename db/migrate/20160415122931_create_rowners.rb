class CreateRowners < ActiveRecord::Migration
  def change
    create_table :rowners do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
