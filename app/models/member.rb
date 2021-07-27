class Member < ApplicationRecord

	# Validations
	validates :name, presence: true
end
