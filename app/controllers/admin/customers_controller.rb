class Admin::CustomersController < ApplicationController
    before_action :search
    
    def index
        @customers = Customer.all
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to admin_customer_path(@customer), notice: "You have updated genre successfully."
        else
            render "edit"
        end
    end
    
   def customer_params
   params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :phone_number, :email, :password, :postcode, :address)
   end
end
