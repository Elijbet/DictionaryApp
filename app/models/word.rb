class Word < ApplicationRecord

	belongs_to :user
	has_many :definitions, dependent: :destroy
	
	accepts_nested_attributes_for :definitions

	self.per_page = 4

end
