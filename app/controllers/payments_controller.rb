class Payments_Controller < ApplicationController

	def create
		@payment = Campaign.new(campaign_params)
		if @payment.save
			payment ={
				title: @payment.title,
				expiration_date: @payment.expiration_date,
				tilt_amount: 100,
        user_id: current_user.ct_id
			}
			begin
				#Crowdtilt.production
				response = Crowdtilt.post('/payments', {payment: payment})
				@payment.update_attributes!(ct_campaign_id: response["campaign"]["id"])
				redirect_to admin_path
			rescue => exception
				flash.now[:error] = exception.to_s
				render 'admin/settings'
			end
		else
			render 'admin/settings', @errors = @payment.errors.full_messages
		end
	end

	def destroy

	end

end