require 'rails_helper'

RSpec.describe Code do
	it "should have a char" do
		code = FactoryGirl.build(:code)
		expect(code.valid?).to be_truthy
	end
end
