class Order < ApplicationRecord
  has_many :products, through: :orders_products_joins
  validates :price_cents
end
