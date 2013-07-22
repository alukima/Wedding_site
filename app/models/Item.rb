class Item < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name 
  validates_presence_of :description  
	validates_presence_of :quantity 
end
