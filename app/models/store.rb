class Store < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :products
  validates :name, presence: true
  validates :user_id, presence: true
end
