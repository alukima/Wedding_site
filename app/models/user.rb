class User < ActiveRecord::Base
	#should have used a different name
	has_many :items_users, :through => :items_users
	has_many :guests, :class_name => 'User', :foreign_key => :host_id
	validates_presence_of :name
	validates_presence_of :email

end
