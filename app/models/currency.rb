class Currency < ApplicationRecord
	validates :currencytype, :presence => true
end
