class Cart < ApplicationRecord
	has_many :products
# 	def add_item(product_id)
#         item = items.where('product_id = ?', product_id).first
#     if item
#         # increase the quantity of product in cart
#         item.quantity + 1
#         save
#     else
#         # product does not exist in cart
#         product = Product.find(product_id)
#         items << product
#     end
#     save
# end
# 	def total_price
#    order_items.to_a.sum(&:full_price)
#  end
end
