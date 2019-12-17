class Event < ApplicationRecord
	belongs_to :user

	validates :start, presence: true
	validates :end, presence: true, if: :game_end_time?

	def game_end_time?
		:start || :end
	end
end
