class Category < ApplicationRecord
  belongs_to :store
  has_many :products_categories_joins
  has_many :products, through: :products_categories_joins
  validates :name, presence: true
  validates :store_id, presence: true
end
