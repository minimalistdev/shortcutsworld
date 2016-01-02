require 'rails_helper'

RSpec.describe Symbol do
	it "symbol should have code" do
		symbol = Symbol.new(code: " ")
		expect(symbol.valid?).to be_falsey
	end
end
