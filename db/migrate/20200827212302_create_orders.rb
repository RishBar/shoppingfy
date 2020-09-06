class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price_cents

      t.timestamps
    end
  end
end
