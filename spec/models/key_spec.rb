require 'rails_helper'

RSpec.describe Key, type: :model do

  it {should validate_presence_of(:name)}

  it {should have_many(:codes)}

  it {should belong_to(:so)}

end