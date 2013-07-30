class CampaignsController < ApplicationController

	def new
		@campaign = Campaign.new
	end

	def show
		@wedding = Wedding.first
		@campaign = Campaign.first
		@payment = Payment.new
	end

	def create
		@campaign = Campaign.new(campaign_params)
		if @campaign.save
			campaign ={
				title: @campaign.title,
				expiration_date: @campaign.expiration_date,
				tilt_amount: 100,
        user_id: current_user.ct_id
			}
			begin
				#Crowdtilt.production
				response = Crowdtilt.post('/campaigns', {campaign: campaign})
				@campaign.update_attributes!(ct_campaign_id: response["campaign"]["id"])
				redirect_to admin_path
			rescue => exception
				flash.now[:error] = exception.to_s
				render 'admin/settings'
			end
		else
			render 'admin/settings', @errors = @campaign.errors.full_messages
		end
	end

	def gift_payment
		# def survey_params
  #     params.require(:survey).permit(:name, 
  #       :questions_attributes => [:id, :content, 
  #         :answers_attributes => [:id, :answer, :participant_id]
  #       ])
  #   end
	end

	def gift_confirmation

	end

	private

	def campaign_params
		params.require(:campaign).permit(:title,:expiration_date, :note, :image_file_name)
	end
end


#schema
    # t.string   "title"
    # t.datetime "expiration_date"
    # t.string   "ct_campaign_id"
    # t.string   "image_file_name"
    # t.text     "note"
    # t.integer  "tilt_amount",     default: 1, null: false
    # t.datetime "created_at"
    # t.datetime "updated_at"