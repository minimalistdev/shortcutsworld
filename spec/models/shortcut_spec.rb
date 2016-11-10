require 'rails_helper'

RSpec.describe Shortcut, type: :model do

  it {should validate_presence_of(:name)}

  it{ should validate_presence_of(:description)}

  it { should validate_presence_of(:shortcut).with_message('must have at least one key') }

  it { should belong_to(:app)}

  it { should allow_value('shift').for(:shortcut) }

end