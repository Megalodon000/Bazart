class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owner_products, foreign_key: "craftman_id"
  has_many :lists, foreign_key: "client_id"
  has_many :client_products, through: :lists
end
