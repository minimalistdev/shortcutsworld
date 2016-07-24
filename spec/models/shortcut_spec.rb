require 'rails_helper'

RSpec.describe Shortcut, type: :model do

  it {should validate_presence_of(:name)}

  it{ should validate_presence_of(:description)}

  it { should belong_to(:app)}

  it { should allow_value('7 + shift').for(:shortcut) }

  it { should_not allow_value('shift').for(:shortcut) }

end