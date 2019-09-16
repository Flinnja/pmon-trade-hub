class Type < ApplicationRecord
	validates :name, presence: true, uniqueness: {case_sensitive: false}

	before_validation :capitalize_name

	private
	def capitalize_name
		name.capitalize if name.present?
	end
end
