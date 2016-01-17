require 'rails_helper'

RSpec.feature "Creating SO" do

  scenario "creating a SO" do
    visit "/"

    click_link "add so"

    fill_in "Name", with: "Windows"
    attach_file("Image Upload", File.absolute_path('./img.png'))

    click_button "Create SO"
  end

end