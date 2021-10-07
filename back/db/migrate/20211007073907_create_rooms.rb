class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
