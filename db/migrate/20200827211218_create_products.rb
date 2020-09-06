class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :description
      t.string :name
      t.integer :quantity
      t.integer :price_cents

      t.timestamps
    end
  end
end
