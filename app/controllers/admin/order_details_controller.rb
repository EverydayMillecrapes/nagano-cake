class Admin::OrderDetailsController < ApplicationController
  before_action :search
    def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    if @order_product.status == "製作中"
      @order_product.order.update(status: 2)
    elsif @order_product.status == "製作完了"
      @order = @order_product.order
      @count = @order.order_products.count
      if @count == OrderProduct.where(status: 3,order_id: @order.id).count
         @order_product.order.update(status: 3)
      end
    end
    redirect_to admin_order_path(@order_product.order), notice: "You have updated user successfully."
    
    end
    
    def order_product_params
  	params.require(:order_product).permit(:amount, :status, :tax_price)
    end
end
