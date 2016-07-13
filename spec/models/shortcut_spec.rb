require 'rails_helper'

RSpec.describe Shortcut, type: :model do

  it {should validate_presence_of(:name)}

  it{ should validate_presence_of(:description)}

  it { should belong_to(:app)}

  it { should validate_presence_of(:pathway)}

end