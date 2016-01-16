require 'rails_helper'

RSpec.describe Code, type: :model do

	it {is_expected.to validate_presence_of(:char)}

end
