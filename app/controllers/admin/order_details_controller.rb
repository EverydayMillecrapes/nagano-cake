class Admin::OrderDetailsController < ApplicationController
    def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    redirect_to admin_order_path, notice: "You have updated user successfully."
    end
    
    def order_product_params
  	params.require(:order_product).permit(:amount, :status, :tax_price)
    end
end
