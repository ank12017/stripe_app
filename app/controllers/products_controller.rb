class ProductsController < ApplicationController
	def new
		@product = Product.new
    @brands = Brand.all.map{|b| [b.name, b.id]}
    @cart = Cart.new
	end
	def show
		@product = Product.find(params[:id])
  
    
	end
	def index
		@product = Product.all
	end
	def edit
		@product = Product.find(params[:id])
	end
    def create
    	@product = Product.new(product_params)
      @product.brand_id = params[:brand_id]
       @cart = Cart.create(params[:cart_id])
    	if @product.save
    	redirect_to @product
        else 
    	render 'new'
        end
    end

    def update
    	 @product = Product.find(params[:id])
 
         if @product.update(product_params)
            redirect_to @product
         else
          render 'edit'
        end
    end
    def destroy
      @product = Product.find(params[:id])
         @product.destroy
        redirect_to products_path
    end

    private
    def product_params
         params.require(:product).permit(:image, :name, :item, :price, :discription, :quantity, :order_id, :brand_id, :cart_id)
    end
end
