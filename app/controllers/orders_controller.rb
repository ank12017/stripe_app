class OrdersController < ApplicationController
	def new
		@order = Order.new
	end
	def show
		@order = Order.find(params[:id])
	end
	def index
		@order = Order.all
	end
	def edit
		@order = Order.find(params[:id])
	end
    def create
    	@order = Order.new(order_params)
    	if @order.save
    	redirect_to @order
        else
    	render 'new'
        end
    end
    def update
    	 @order = Order.find(params[:id])
 
         if @order.update(order_params)
            redirect_to @order
         else
          render 'edit'
        end
    end
  private
  def order_params
       params.require(:order).permit(:name, :order_details)
  end

end
