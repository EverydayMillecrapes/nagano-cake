class Customer::HomesController < ApplicationController
  def top
   @products = Product.all.order("created_at DESC").limit(4)
  end
end
