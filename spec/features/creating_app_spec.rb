require 'rails_helper'

RSpec.feature "Creating App" do

  scenario "successful on creating a App", :js => true do
    # page.driver.browser.manage.window.resize_to(1500,780)

    Capybara.ignore_hidden_elements = false

    FactoryGirl.create(:so)

    visit "/"

    page.find(".so_id_1").click

    click_on "new-app-btn"


    expect(page).to have_selector('h2', :text => "Create App")

    fill_in "Name", with: "Intellij"
    attach_file('app_img', File.absolute_path('./spec/support/intellij.png'))


    page.save_screenshot('screenshot.png')
    page.find("#create-app-btn").click


    expect(page).to have_css(".app-name", :text => "Intellij")
    expect(page).to have_selector('#notice', visible: false, :text => "App created successfully!")
  end



end