class Hardware < ApplicationRecord
	belongs_to :user
	resourcify
  belongs_to :type
end
