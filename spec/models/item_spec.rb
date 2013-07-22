require 'spec_helper'

describe Item do
	it { should validate_presence_of :name }
	it { should validate_presence_of (:description) }
	it { should validate_presence_of :quantity }
	it { should belong_to(:user) }
end

