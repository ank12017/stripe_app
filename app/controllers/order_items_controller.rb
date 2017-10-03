class OrderItemsController < ApplicationController
	def new
		@order_item = OrderItem.new
	end
	def show
		@order_item = OrderItem.find(params[:id])
	end
	def index
		@order_items = OrderItem.all
	end
	def edit
		@order_item = OrderItem.find(params[:id])
	end
  def create
    	@order_item = OrderItem.new(order_item_params)
    	if @order_item.save
    	redirect_to @order_item
      else
    	render 'new'
     end
  end
  def update
    	 @order_item = OrderItem.find(params[:id])
      if @order_item.update(order_item_params)
          redirect_to @order_item
      else
        render 'edit'
      end
  end
  private
  def order_item_params
       params.require(:order_item).permit(:quantity, :total, :product_id)
  end

  
end
