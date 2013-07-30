class Payment < ActiveRecord::Base
	validates :fullname, presence: true
	validates :email, presence: true
	belongs_to :campaign
end
