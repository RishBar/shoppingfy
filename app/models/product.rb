class Product < ApplicationRecord
  has_many :products_categories_joins
  has_many :categories, through: :products_categories_joins
  has_many :orders_products_joins
  has_many :orders, through: :orders_products_joins
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price_cents, presence: true
  validates :description, presence: true
end