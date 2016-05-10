require 'rails_helper'

RSpec.feature "Creating App" do

  Capybara.ignore_hidden_elements = false

  scenario "successful on creating an App", :js => true do

    FactoryGirl.create(:so)

    visit "/"

    page.execute_script "window.scrollBy(0,-500)"

    page.find(".so_id_1 > div > div > h3").click

    click_on "new-app-btn"

    expect(page).to have_selector('h2', :text => "Create App")

    fill_in "Name", with: "Intellij"
    attach_file('app_img', File.absolute_path('./spec/support/intellij.png'))

    page.find("#create-app-btn").click

    expect(page).to have_css(".app-name", :text => "Intellij")
    expect(page).to have_selector('#notice', visible: false, :text => "App created successfully!")
  end


  scenario "select an app before creating", :js => true do

    visit "/"

    page.execute_script "window.scrollBy(0,-500)"

    click_on "new-app-btn"

    expect(page).to have_selector('.bootstrap-growl', visible: false, :text => "Please select the So")
  end
end

