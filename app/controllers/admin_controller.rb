class AdminController < ApplicationController
	before_filter :check_privledges
	
	def settings
		if Wedding.first.nil?
			@wedding = Wedding.new
		else 
			@wedding = Wedding.first
		end
		if Campaign.first.nil?
			@campaign = Campaign.new
		else
			@campaign = Campaign.first
		end
	end

	def verify_admin #turn into get user
		check_user(current_user)
		verification = {
			name: params[:name],
			dob:  params[:dob],
			phone_number: params[:number],
			street_address: params[:street_address],
			postal_code: params[:postal_code]}
			#Crowdtilt.production  
			response = Crowdtilt.post("/users/#{current_user.ct_id}/verification", {verification: verification})  
		end


		private 

		def check_privledges
			unless current_user && current_user.is_admin
				redirect_to root_path
			end
		end

	end
