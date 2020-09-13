class OrdersProductsJoin < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :price_cents, presence: true
  validates :quantity, presence: true
  validates :product_id, presence: true
  validates :order_id, presence: true
end
