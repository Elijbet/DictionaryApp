class Definition < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :word
end
