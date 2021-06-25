class Admin::OrdersController < ApplicationController
def index
    @orders = Order.all
    @order_products = OrderProduct.all
end

def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
end

def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path, notice: "You have updated user successfully."
end


def order_params
  	params.require(:order).permit(:name, :postcode, :address, :postage, :total_amount, :payment_method, :status)
end

end
