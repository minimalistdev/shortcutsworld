require 'rails_helper'

RSpec.feature "Creating SO" do

  scenario "successful on creating a SO" do

    visit "/"

    click_link "new-so-btn"

    fill_in "Name", with: "Mac OS X"
    attach_file('so_img', File.absolute_path('./spec/support/mac_os_x.jpg'))

    click_button "Create SO"

    expect(page).to have_css(".so-name", :text => "Mac OS X")
    expect(page).to have_selector('#notice', visible: false, :text => "SO created successfully!")
  end

  scenario "missing name" do

    visit '/'

    click_link "new-so-btn"

    attach_file('so_img', File.absolute_path('./spec/support/mac_os_x.jpg'))

    click_button "Create SO"

    expect(page).to have_selector('#alert', visible: false, :text => "Error on create SO")
  end

  scenario "missing img file" do

    visit '/'

    first(:link, '+').click

    fill_in "Name", with: "Ubuntu"

    click_button "Create SO"

    expect(page).to have_selector('#alert', visible: false, :text => "Error on create SO")
  end

end