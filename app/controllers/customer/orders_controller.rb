class Customer::OrdersController < ApplicationController

  def new
  	@order = Order.new
  	@deliveries = Delivery.where(customer: current_customer)
  end

  def log
    @cart_products = current_customer.cart_products
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    if params[:erea] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:erea] == "1"
      @delivery = Delivery.find(params[:delivery][:id])
      @order.postcode = @delivery.postcode
      @order.address = @delivery.address
      @order.name = @delivery.name

    elsif params[:erea] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save

     @cart_products = current_customer.cart_products
     @cart_products.each do |cart_product|
     OrderProduct.create(
      product_id:  cart_product.product_id,
      order_id:  @order.id,
      amount: cart_product.amount,
      tax_price: cart_product.product.non_tax_price * 1.1
    )
     end
      current_customer.cart_products.destroy_all
      redirect_to customer_orders_thanx_path
  end

  def thanx
  end

  def index
    @customer = current_customer
    @orders = @customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  private
  def order_params
   params.require(:order).permit(:customer_id, :name, :postcode, :address, :postage, :total_amount, :payment_method, :status)
  end
  

end
