class CreateProductsCategoriesJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :products_categories_joins do |t|
      t.references :product, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
