require 'spec_helper'

describe User do
	it { should validate_presence_of :name }
	it { should validate_presence_of :email }
	it { should have_many(:guests) }
	it { should have_many(:items) }
	it { should respond_to(:name)}
	it { should respond_to(:passcode)}
	it { should respond_to(:email)}


	describe "when name is not present" do
		let(:user) { Fabricate(:user, name = '', email ='mary@test.com') }
		it { should_not be_valid }
	end
	
	describe "when email is not present" do
		let(:user) { Fabricate(:user, name = 'amy', email = '') }
		it { should_not be_valid }
	end
end