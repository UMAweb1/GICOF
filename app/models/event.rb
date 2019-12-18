class Event < ApplicationRecord
	belongs_to :user

	validates :start, presence: true
	validates :end, presence: true
	validates :title, presence: true
	validates :description, presence: true

end
