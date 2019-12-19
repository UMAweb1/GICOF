module ApplicationHelper
	def read_flag(user)
		@rooms = []
		user.entries.each do |f|
			@rooms << f.room_id
		end
		return Entry.where("user_id != ?", user.id).where(room_id: @rooms).where(read: true).count
	end
end
