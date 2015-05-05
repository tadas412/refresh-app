class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text	:description
      t.float :rating,          default: nil
      t.date	:date
      t.time 	:time
      t.integer :thumbs_up,     default: 0
      t.integer	:thumbs_down,   default: 0

      t.timestamps null: false
    end
  end
end
