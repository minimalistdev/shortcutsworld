require 'rails_helper'

RSpec.describe Key do

  it "have a name" do
    key = FactoryGirl.build(:key)
    expect(key).to be_valid
  end

  it "have one or more codes" do
    key = FactoryGirl.create(:key)
    code = FactoryGirl.create(:code)
    code2 = FactoryGirl.create(:code, char: "enter")

    key.codes << code
    key.codes << code2

    expect(key.codes.count).to eq(2)

  end
end