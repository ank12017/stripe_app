class OrderItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true
  belongs_to :cart, optional: true
  after_create :set_total_price

  def set_total_price
  	self.total = self.quantity * self.product.price
  end

end
