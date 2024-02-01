class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :collection, presence: true
  validates :material, presence: true
  validates :color, presence: true

  COLLECTION = %w(chairs tables lamps shelves desks pots sofas chandeliers vases jewelry)
  MATERIAL = %w(Gold Silver Bronze glass wood plastic pottery clay marble plaster aluminum)
  COLOR = %w(Red Blue Green Yellow Black White Purple Brown)

  has_many :reviews
  belongs_to :craftman, class_name: "User", foreign_key: "craftman_id"
  has_many :lists
  has_many :clients, through: :lists, class_name: "User", foreign_key: "client_id"
end
