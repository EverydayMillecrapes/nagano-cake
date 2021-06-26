class Admin::OrderDetailsController < ApplicationController
  before_action :search
    def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    if @order_product.status == "製作中"
      @order_product.order.update(status: 2)
    end
    redirect_to admin_order_path, notice: "You have updated user successfully."
    
    end
    
    def order_product_params
  	params.require(:order_product).permit(:amount, :status, :tax_price)
    end
end
