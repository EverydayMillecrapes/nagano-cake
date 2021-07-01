class Admin::OrdersController < ApplicationController
    before_action :search
    
def index
    if params[:order_sort] ==  "0"
        @orders = Order.all
    else
        @orders = Order.where(customer_id: params[:order_sort])
    end
    @order_products = OrderProduct.all
end

def search
    @q = Product.ransack(params[:q])
    @Productss = @q.result(distinct: true)
end

def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
end

def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if params[:order][:status] == "入金確認" #ターミナル参照
        @order.order_products.each do |order_product| #注文に紐づいているすべての注文商品のステータスを一つずつ変更
            order_product.update(status: 1)
        end
    end
    
    redirect_to admin_order_path, notice: "You have updated user successfully."
end


def order_params
  	params.require(:order).permit(:name, :postcode, :address, :postage, :total_amount, :payment_method, :status)
end

end
