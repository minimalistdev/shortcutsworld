require 'rails_helper'

RSpec.describe Symbol do
	it "should have code" do
		symbol = FactoryGirl.build(:symbol)
		expect(symbol.valid?).to be_falsey
	end
end
