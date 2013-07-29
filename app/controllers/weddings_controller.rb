class WeddingsController < ApplicationController

	def home
		@wedding= Wedding.first
	end

	def new
		@wedding = Wedding.new
	end

	def edit
		@wedding= Wedding.find(wedding_params)
	end

	def create
		@wedding= Wedding.new(wedding_params)
		puts @wedding.errors
		if @wedding.save
			flash[:errors] = @wedding.errors.full_messages
			render 'admin/settings'
		else 
			flash[:notice] = "Wedding Created."
			render 'admin/settings'
		end
	end

	def update
		@wedding = Wedding.find(params[:id])
		@wedding.update_attributes!(wedding_params)
		puts @wedding.errors
		if @wedding.save
			flash[:errors] = @wedding.errors.full_messages
			render 'admin/settings'
		else 
			flash[:notice] = "Wedding Created."
			ender 'admin/settings'
		end
	end

	def destroy
		@wedding= Wedding.find(params[:id])
		@wedding.destroy
	end

	private

	def wedding_params
		params.require(:wedding).permit(:name, :tag_line, :date, 
			:venue_name, :venue_photo, :directions, :about_us, :general_info, :about_him,
			:about_her, :about_her, :address, :city, :state, :zip_code, :user_id => current_user.id)
	end
end

		#schema
    	# t.string :name
    	# t.string :tag_line
    	# t.datetime :date
    	# t.string :venue_name
    	# t.string :venue_photo
    	# t.text :directions
    	# t.text :about_us
    	# t.text :general_info
    	# t.text :about_him
    	# t.text :about_her
    	# t.string :address
    	# t.string :city
    	# t.string :state
    	# t.integer :zip_code
    	# t.integer :user_id