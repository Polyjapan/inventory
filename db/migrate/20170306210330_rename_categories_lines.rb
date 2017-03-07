class RenameCategoriesLines < ActiveRecord::Migration[5.0]
  def change
     rename_table :categories_lines, :categories_items
  end
end
