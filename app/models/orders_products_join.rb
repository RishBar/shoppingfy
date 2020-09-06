class OrdersProductsJoin < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :price_cents
  validates :quantity
  validates :product_id, presence: true
  validates :order_id, presence: true
end
