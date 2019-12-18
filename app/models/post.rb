class Post < ApplicationRecord
	belongs_to :user

	validates :post, presence:true, length: {maximum: 150}
end
