class CreateUsers < ActiveRecord::Migration
	def change 
		create_table :users, :force => true do |t|
			t.string   :email,                                     :null => false
			t.string   :password_digest,     		                    :null => false
			t.timestamps
			t.string   :name
			t.boolean  :is_admin,               :default => false
			t.integer  :host_id
		end
	end
end

