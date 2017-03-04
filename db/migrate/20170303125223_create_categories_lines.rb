class CreateCategoriesLines < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_lines, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :line, index: true
    end
  end
end
