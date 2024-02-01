class Review < ApplicationRecord
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :comment, presence: true, length: { minimum: 5, maximum: 1000 }
  validates :user_id, uniqueness: { scope: :product_id, message: "has reviewed this product already" }
  
  belongs_to :product
  belongs_to :user

end
