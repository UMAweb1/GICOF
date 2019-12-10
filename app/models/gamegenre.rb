class Gamegenre < ApplicationRecord
	has_many :likes
	has_many :gamegenres, through: :likes
end
