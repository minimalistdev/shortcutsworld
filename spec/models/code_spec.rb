require 'rails_helper'

RSpec.describe Code do
	it "should have a char" do
		code = FactoryGirl.create(:code)
		expect(code).to be_valid
	end
end
