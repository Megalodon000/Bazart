class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :collection, presence: true
  validates :material, presence: true
  validates :color, presence: true

  has_many :reviews

end
