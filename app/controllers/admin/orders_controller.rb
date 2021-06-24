class Admin::OrdersController < ApplicationController
def index
    @orders = Order.all
    @order_products = OrderProduct.all
end
end
