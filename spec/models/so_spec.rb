require 'rails_helper'

RSpec.describe So, type: :model do

  it {should validate_presence_of(:name)}

  it {should have_many(:keys)}

  it {should have_many(:apps)}

end
