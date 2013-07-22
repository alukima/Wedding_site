class User < ActiveRecord::Base
	has_many :items, :through => :items_users
	has_many :guests, :class_name => 'User', :foreign_key => :host_id
	validates_presence_of :name
	validates_presence_of :email

end
