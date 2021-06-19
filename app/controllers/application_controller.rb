class ApplicationController < ActionController::Base

  protected
    # def after_sign_in_path_for(resource)
    #   if customer_signed_in?
    #     customer_root_path(resource)
    #   else
    #     admin_top_path
    #   end
    # end

    def after_sign_out_path_for(resource)
      customer_root_path
    end

  		# devise_parameter_sanitizer.permit(:sign_in, keys: [:email])

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end