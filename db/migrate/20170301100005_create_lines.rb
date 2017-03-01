class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.integer  "item_id"
      t.text     "note"
      t.integer  "location_id"
      t.integer  "quantity"
      t.datetime "expire_on"

      t.timestamps
    end
  end
end
