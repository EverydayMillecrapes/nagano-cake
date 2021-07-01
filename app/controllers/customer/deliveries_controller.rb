class Customer::DeliveriesController < ApplicationController

  def index
    @customer = current_customer
    @delivery = Delivery.new
    @deliveries = @customer.deliveries.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_back(fallback_location: customer_root_path)
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
     @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to customer_deliveries_path, notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to customer_deliveries_path
  end

  private

	def delivery_params
  	params.require(:delivery).permit(:postcode, :address, :name)
  end


end
