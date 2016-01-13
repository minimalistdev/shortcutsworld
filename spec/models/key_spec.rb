require 'rails_helper'

RSpec.describe Key do

  it "has a name" do
    key = FactoryGirl.create(:key)
    expect(key).to be_valid
  end

  it "has one or more codes" do
    key = FactoryGirl.create(:key)
    code = FactoryGirl.create(:code)
    code2 = FactoryGirl.create(:code, char: "enter")

    key.codes << code
    key.codes << code2

    expect(key.codes.count).to eq(2)
  end

  it "belongs to a so" do
    key = FactoryGirl.create(:key)
    so = FactoryGirl.create(:so)

    so.keys << key

    expect(key.so).to eq(so)
  end
end