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

	def verify_admin
		if current_user.ct_id.nil?
			#Crowdtilt.production 
			response = Crowdtilt.post('/users', { user: {email: current_user.email}})
			puts response
		else
			user = {
				firstname: params[:first_name],
				lastname: params[:last_name],
				email: params[:email]}
				Crowdtilt.production  
			end
		end


		private 

		def check_privledges
			unless current_user && current_user.is_admin
				redirect_to root_path
			end
		end

	end
