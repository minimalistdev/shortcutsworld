require 'rails_helper'

RSpec.describe So do

  it "has a name" do
    so = FactoryGirl.build(:so)
    expect(so).to be_valid
  end

  it "has one or more keys" do
    so = FactoryGirl.create(:so)
    key = FactoryGirl.create(:key)
    key2 = FactoryGirl.create(:key, name: "enter")

    so.keys << key
    so.keys << key2

    expect(so.keys.count).to eq(2)
  end

end
