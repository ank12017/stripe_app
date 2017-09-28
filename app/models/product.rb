class Product < ApplicationRecord
	belongs_to :cart, optional: true
	 mount_uploader :image, ImageUploader
	belongs_to :brand
end
