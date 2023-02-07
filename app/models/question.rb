class Question < ApplicationRecord
	belongs_to :author
	belongs_to :moderator
end
