class Admin::ProductsController < ApplicationController
    def new
     @product = Product.new
    end
    
    def index
     @products = Product.all
    end
    
    def create
    @product= Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
    end
    
    def show
    @product = Product.find(params[:id])
    end
    
    def edit
    @product = Product.find(params[:id])
    end

    def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
        redirect_to admin_product_path(@product), notice: "You have updated genre successfully."
    else
        render "edit"
    end
    end
    
    def product_params
    params.require(:product).permit(:name, :non_tax_price, :introduction, :is_active, :genre_id, :image)
    end
    
end
