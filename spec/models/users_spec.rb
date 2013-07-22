require 'spec_helper'

describe Users do
	it { should validate_presence_of :name }
	it { should validate_presence_of :email }
	it { should respond_to(:name)}
	it { should respond_to(:guest)}
	it { should respond_to(:passcode)}
	it { should respond_to(:email)}
	it { should have_many(:guests) }
  it { should have_many(:item).through(:items_users) }
end

