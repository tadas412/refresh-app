class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :rating
      t.text :review
      t.integer :thumbs

      t.timestamps null: false
    end
  end
end
