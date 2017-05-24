class Definition < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :word

	self.per_page = 4

	acts_as_votable
	
end
