class AdminController < ApplicationController
	before_filter :check_privledges
	
	def settings
		if Wedding.first.nil?
			@wedding = Wedding.new
		else 
			@wedding = Wedding.first
		end
		@campaign = Campaign.first unless Campaign.first.nil?
	end


private 

def check_privledges
	unless current_user && current_user.is_admin
		redirect_to root_path
	end
end

end
