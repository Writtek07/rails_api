class Question < ApplicationRecord
	belongs_to :author
	belongs_to :moderator

	CATEGORIES = %w[GEOGRAPHY SCIENCE POLITICS LITERATURE OTHERS].freeze

	validates :category, inclusion: { in: CATEGORIES }
end
