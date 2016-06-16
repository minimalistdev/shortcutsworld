require 'rails_helper'

RSpec.describe Key, type: :model do

  it {should validate_presence_of(:char)}

  it {should belong_to(:so)}

end