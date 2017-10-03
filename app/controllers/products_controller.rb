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
          # @product.brand_id = params[:brand_id]
           
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
      def create_order_items
          @order_item = OrderItem.new(item_params)
          @product = Product.find(params[:create_order_items][:product_id])
          if @order_item.save
            @order_item.update(:total => @order_item.quantity * @product.price)
            flash[:notice] = "Item added successfully to cart!"
            redirect_to product_path(@product)
          end
      end
      def create_cart
        @cart = Cart.new(cart_params)
        @product = Product.find(params[:create_cart][:product_id])
        if @cart.save
          @cart.update(:total_price => @order_item.quantity * @product.price)
          redirect_to cart_path(@cart)
        end
      end
  private
      def product_params
         params.require(:product).permit(:image, :name, :item, :price, :discription, :quantity, :total, :order_id, :brand_id, :cart_id)
      end

      def item_params
         params.require(:create_order_items).permit(:quantity, :product_id, :total)
      end

      def cart_params
        params.require(:create_cart).permit(:total_price)
      end
end

