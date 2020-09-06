class CreateOrdersProductsJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_products_joins do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.integer :price_cents

      t.timestamps
    end
  end
end
