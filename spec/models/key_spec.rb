require 'rails_helper'

RSpec.describe Key do
  it "should have a name" do
    key = FactoryGirl.create(:key)
    expect(key).to be_valid
  end
end