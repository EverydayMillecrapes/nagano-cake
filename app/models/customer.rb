class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    last_name + first_name
  end

  has_many :deliveries
  has_many :orders
  has_many :cart_products,dependent: :destroy
  
  def self.search(search)
      return Customer.all unless search
      Customer.where("first_name like? OR last_name like?","%#{search}%","%#{search}%")
  end
end
