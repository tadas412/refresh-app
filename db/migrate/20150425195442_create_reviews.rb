class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :rating
      t.text :review
      t.integer :thumbs
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
