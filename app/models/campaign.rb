class Campaign < ActiveRecord::Base
	has_many :payments
	accepts_nested_attributes_for :payments
end
