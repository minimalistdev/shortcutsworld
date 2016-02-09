require 'rails_helper'

RSpec.feature "Creating SO" do

  scenario "successful on creating a SO" do

    visit "/"

    click_link "new-so-btn"

    fill_in "Name", with: "Windows"
    attach_file('so_img', File.absolute_path('./app/assets/images/profile.png'))

    click_button "Create SO"

    expect(page).to have_css(".so-name", :text => "Windows")
    expect(page).to have_selector('#notice', visible: false, :text => "SO created successfully!")
  end

  scenario "missing name" do

    visit '/'

    first(:link, '+').click

    attach_file('so_img', File.absolute_path('./app/assets/images/profile.png'))

    click_button "Create SO"

    expect(page).to have_selector('#alert', visible: false, :text => "Error on create SO")
  end

  scenario "missing img file" do

    visit '/'

    first(:link, '+').click

    fill_in "Name", with: "Windows"

    click_button "Create SO"

    expect(page).to have_selector('#alert', visible: false, :text => "Error on create SO")
  end

end