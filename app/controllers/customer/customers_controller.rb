class Customer::CustomersController < ApplicationController
 #before_action :ensure_correct_customer, {only: [:show, :edit]}

  def out
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to customer_root_path
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
      flash[:success] = "You have edited customer data successfully."
      redirect_to customer_customer_path(@customer)
    else
      render 'edit'
    end
  end

  def quit
   @customer = current_customer
  end

  private
  def customer_params
   params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :phone_number, :email, :password, :postcode, :address)
  end

  #def ensure_correct_customer
   #@customer = Customer.find(params[:id])
    #if current_customer.id != @customer.id
     #redirect_to root_path
    #end
  #end
end