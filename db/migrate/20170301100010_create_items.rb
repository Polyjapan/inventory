class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string   "name"
      t.text     "description"
      t.datetime "expire_on"

      t.timestamps
    end
  end
end
