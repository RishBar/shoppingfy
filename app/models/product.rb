class Product < ApplicationRecord
  belongs_to :store
  has_many :products_categories_joins
  has_many :categories, through: :products_categories_joins
  has_many :orders_products_joins
  has_many :orders, through: :orders_products_joins
  has_one_attached :picture
  validates :name, presence: true
  validates :price_cents, presence: true, numericality: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
end