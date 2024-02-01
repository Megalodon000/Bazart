class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :collection, presence: true
  validates :material, presence: true
  validates :color, presence: true

  has_many :reviews
  belongs_to :craftman, class_name: "User", foreign_key: "craftman_id"
  has_many :lists
  has_many :clients, through: :lists, class_name: "User", foreign_key: "client_id"
end
