require 'rails_helper'

RSpec.feature "Creating App" do

  scenario "successful on creating a App" do

    visit "/"

    click_link "new-app-btn"

    fill_in "Name", with: "Eclipse"
    attach_file('so_img', File.absolute_path('./app/assets/images/profile.png'))

    click_button "Create App"

    expect(page).to have_css(".app-name", :text => "Eclipse")
    expect(page).to have_selector('#notice', visible: false, :text => "App created successfully!")
  end



end