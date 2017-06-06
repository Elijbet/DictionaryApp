class Word < ApplicationRecord

	belongs_to :user
	#, optional: true
	has_many :definitions, dependent: :destroy
	
	accepts_nested_attributes_for :definitions
	#, reject_if: proc { |attributes| attributes[:definition].blank? }

	validates :word, presence: true

	self.per_page = 4

end
