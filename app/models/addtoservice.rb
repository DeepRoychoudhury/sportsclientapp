class Addtoservice < ApplicationRecord
	validates :country, :sportsplayed, :presence => true
end
