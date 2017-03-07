class RenameColumnInCategoriesItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories_items, :line_id, :item_id
  end
end
