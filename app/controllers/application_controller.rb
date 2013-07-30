class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CurrentUser

  helper_method :current_user

  private

  def campaign_id
  	Wedding.first.ct_campaign_id
  end

  def check_user
  	if current_user.ct_id.nil?
			Crowdtilt.create_user(email: current_user.email)
		end
	end
end
