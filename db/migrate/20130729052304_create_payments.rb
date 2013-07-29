class CreatePayments < ActiveRecord::Migration
	def change
		create_table :payments, :force => true  do |t|
			t.string   "ct_payment_id"
			t.string   "status"
			t.integer  "amount"
			t.string   "fullname"
			t.string   "email"
			t.string   "card_type"
			t.string   "card_last_four"
			t.string   "card_expiration_month"
			t.string   "card_expiration_year"
			t.integer  "campaign_id"
			t.string   "address_one"
			t.string   "address_two"
			t.string   "city"
			t.string   "state"
			t.string   "postal_code"
			t.string   "country"
			t.integer  "quantity"
			t.text     "additional_info"
			t.timestamps
		end
	end
end

