class Tag < ApplicationRecord

	belongs_to :user

	def serializable_hash(*)
		hash = {}
		[:id, :user_id, :description].each {|p| hash[p] = self[p]}
		hash['user_name'] = user.full_name
		return hash
	end
end
