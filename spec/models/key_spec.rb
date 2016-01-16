require 'rails_helper'

RSpec.describe Key do

  it {should validate_presence_of(:name)}

  it {should have_many(:codes)}

  it {should belong_to(:so)}
end