class Pokemon < ApplicationRecord
	validates :name, presence: true, uniqueness: {case_sensitive: false}

	validates :national_dex_no, presence: true, uniqueness: true

	before_validation :capitalize_name

	private
	def capitalize_name
		name.capitalize if name.present?
	end
end
