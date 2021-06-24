class Customer::CartProductsController < ApplicationController
  def index
   @cart_products = current_customer.cart_products
   @total_price = calculate(current_customer)
  end

  def create
   @cart_product = CartProduct.new(cart_product_params)
   @cart_product.customer_id = current_customer.id
   @old_cart_product = CartProduct.find_by(customer_id:current_customer.id,product_id:params[:cart_product][:product_id])#以前の同じ商品のカートアイテムを探している。
   if @old_cart_product.present?#同じものがあればture、無ければfolse
      @old_cart_product.amount += params[:cart_product][:amount].to_i
      @old_cart_product.save
      redirect_to customer_cart_products_path
   else
      @cart_product.save
      redirect_to customer_cart_products_path
   end
  end

 def update
   @cart_product = CartProduct.find(params[:id])
   @cart_products.update(cart_product_params)
   redirect_to customer_cart_product_path
 end

 def destroy
   cart_product = CartProduct.find(params[:id])
   cart_product.destroy
   redirect_to customer_cart_products_path
 end

 def all_destroy
   current_customer.cart_products.destroy_all
   redirect_to customer_cart_products_path
 end

 def cart_product_params
   params.require(:cart_product).permit(:customer_id, :product_id, :amount)
 end

 def calculate(user)
   total_price = 0
   user.cart_products.each do |cart_product|
     total_price += cart_product.amount * cart_product.product.non_tax_price
   end
   return (total_price * 1.1).floor
 end
end

