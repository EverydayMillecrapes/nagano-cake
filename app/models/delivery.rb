class Delivery < ApplicationRecord

  belongs_to :customer

  # order/newで使用
	def order_address
			self.postcode + self.address + self.name
	end
end
