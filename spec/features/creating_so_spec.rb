require 'rails_helper'

RSpec.feature "Creating SO" do

  scenario "successful on creating a SO" do
    visit "/"

    first(:link, '+').click

    fill_in "Name", with: "Windows"
    attach_file('so_img', File.absolute_path('./app/assets/images/profile.png'))

    click_button "Create SO"

    expect(page).to have_css(".so-name", :text => "Windows")
    expect(page).to have_selector('#notice', visible: false, :text => "SO created successfully!")
  end

  scenario "error on create so" do
    visit "/"

    first(:link, '+').click

    click_button "Create SO"

    expect(page).to have_selector('#alert', visible: false, :text => "Error on create SO")
  end

end