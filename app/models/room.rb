class Room < ApplicationRecord
	has_many :entry
	has_many :message
end
