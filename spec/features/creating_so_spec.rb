require 'rails_helper'

RSpec.feature "Creating SO" do

  scenario "creating a SO" do
    visit "/"

    first(:link, '+').click

    fill_in "Name", with: "Windows"
    attach_file('so_img', File.absolute_path('./app/assets/images/profile.png'))

    click_button "Create SO"

    expect(page).to have_content("SO created successfully!")
  end

end