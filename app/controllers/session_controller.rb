class SessionController < ApplicationController

	def sign_in

	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:id] = user.id
			redirect_to your_profile_path, notice: "Signed in!"
		else
			flash[:errors] = {"Login" => ["Email and Password combination not found"]}
			redirect_to root_path
		end
	end

	def sign_out
		session.clear
		redirect_to root_path
	end
end
