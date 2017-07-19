class Type < ApplicationRecord


	
	belongs_to :user
	has_many :hardwares

	accepts_nested_attributes_for :hardwares

	
end
