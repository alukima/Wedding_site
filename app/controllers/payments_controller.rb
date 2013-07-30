class PaymentsController < ApplicationController

	def create
		@payment = Payment.new(payment_params)
		if @payment.save
			ct_user_response = Crowdtilt.create_user(email: @payment.email)

			card = { 
				expiration_year: @payment.card_expiration_year, 
				security_code: params[:security_code], 
				expiration_month: @payment.card_expiration_month,
				number: params[:card_number]
			}

			ct_card_response = Crowdtilt.post("/users/#{ct_user_response["id"].to_s}/cards", {card: card})

			ct_payment = {
				amount: @payment.amount,
				user_fee_amount: 0,
				admin_fee_amount: 0,
				user_id: ct_user_response["user"]["id"],
				card_id: ct_card_response["card"]["id"]
			}

			begin
				response = Crowdtilt.post("/campaigns/#{campaign_id}/payments", {payment: ct_payment})
				@payment.update_attributes!(ct_campaign_id: response["campaign"]["id"])
				redirect_to admin_path
			rescue => exception
				flash.now[:error] = exception.to_s
				render 'admin/settings'
			end
		else
			render 'campaigns#show', @errors = @payment.errors.full_messages
		end
	end


	def destroy

	end

	private 

	def payment_params
		params.require(:payment).permit(:fullname, :email, :address_one, :address_two, :city, :state, 
			:postal_code, :amount, :card_expiration_month, :card_expiration_year)
	end

end

