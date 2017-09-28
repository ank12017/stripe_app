class CartController < ApplicationController
def new
		@cart = Cart.new
	end
	
  def show
    @cart = @current_cart
  end

  
	def index
		@cart = Cart.all
	end
	def edit
		@cart = Cart.find(params[:id])
	end
    def create
    	@cart = Cart.new(cart_params)
    	if @cart.save
    	redirect_to @cart
        else
    	render 'new'
        end
    end
    def update
    	 @cart = Cart.find(params[:id])
 
         if @cart.update(cart_params)
            redirect_to @cart
         else
          render 'edit'
        end
    end
    def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
  private
  def cart_params
       params.require(:cart).permit(:total_price)
  end
	
end
