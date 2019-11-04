class User < ApplicationRecord

	has_secure_password

	has_many :tags, dependent: :destroy

	validates :first_name, presence: {message: "First name can't be blank"}, length: {maximum: 100, message: "First name can't be more than 100 characters"}
	validates :last_name, presence: {message: "Last name can't be blank"}, length: {maximum: 100, message: "Last name can't be more than 100 characters"}
	validates :email, presence: {message: "Email can't be blank"}, uniqueness: {case_sensitive: false, message: "Email already exists"}

	def full_name
		"#{first_name} #{last_name}" rescue "---" 
	end

	def serializable_hash(*)
		hash = {}
		[:id, :email].each {|p| hash[p] = self[p]}
		hash['name'] = full_name
		return hash
	end
end
