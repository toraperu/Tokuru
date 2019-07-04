class Product < ApplicationRecord

	belongs_to :genre
	belongs_to :user

	attachment :jacket_image
end
