class Pokemon < ApplicationRecord
	validates :name, presence: {message: "Name cannot be empty"}, uniqueness: {case_sensitive: false, message: "Name already exists in database"}

	validates :national_dex_no, presence: {message: "Dex Number cannot be empty"}, uniqueness: {case_sensitive: false, message: "Dex number already exists in database"}

	before_validation name.capitalize if name.present?
end
