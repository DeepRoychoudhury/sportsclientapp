class Sportskit < ApplicationRecord
	belongs_to :sports, optional: true
end
