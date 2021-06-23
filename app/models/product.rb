class Product < ApplicationRecord

  has_many :cart_products, dependent: :destroy
	has_many :cart_products
	has_many :order_products
	belongs_to :genre

	attachment :image
# 	enum status: [:販売可, :販売不可]
end

