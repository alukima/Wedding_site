class Item < ActiveRecord::Base
	it { should validate_presence_of :name }
	it { should validate_presence_of :descprition }
	it { should validate_presence_of :quantity }
	it { should belong_to(:user) }
	
end
