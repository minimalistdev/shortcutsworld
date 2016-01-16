require 'rails_helper'

RSpec.describe So do

  it {should validate_presence_of(:name)}

  it {should have_many(:keys)}

end
