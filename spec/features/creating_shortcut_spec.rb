require 'rails_helper'

RSpec.feature "Creating Shortcuts" do

  Capybara.ignore_hidden_elements = false

  before(:each) do
    so = FactoryGirl.create(:so)
    FactoryGirl.create(:app, so: so)
  end

  scenario 'create a shortcut', :js => true do

    visit "/"

    page.find(".so_id_1 > div > div > h3").click

    wait_for_animation
    wait_for_ajax

    page.find(".app_id_1 > div > div > h3").click

    wait_for_animation

    click_on "new-shortcut-btn"

    expect(page).to have_selector('h2', :text => "Create Shortcut")

    fill_in "Name", with: "Copy"
    fill_in "Description", with: "Copy something"

    page.find(".c67").click
    first(".command").click

    click_on "Create Shortcut"

    expect(page).to have_selector('#notice', visible: false, :text => "Shortcut created successfully!")

  end

  scenario 'error on create a shortcut, must have one key', :js => true do

    visit "/"

    page.find(".so_id_1 > div > div > h3").click

    wait_for_animation
    wait_for_ajax

    page.find(".app_id_1 > div > div > h3").click

    wait_for_animation

    click_on "new-shortcut-btn"

    expect(page).to have_selector('h2', :text => "Create Shortcut")

    fill_in "Name", with: "Copy"
    fill_in "Description", with: "Copy something"

    click_on "Create Shortcut"

    expect(page).to have_selector('#alert', visible: false, :text => "Shortcut must have at least one key")
  end

  scenario 'select the so and app to create a shortcut', :js => true do

    visit "/"

    page.find(".so_id_1 > div > div > h3").click

    wait_for_animation

    click_on "new-shortcut-btn"

    expect(page).to have_selector('.bootstrap-growl', visible: false, :text => "Please select the App")
  end

  scenario 'Clean shortcuts', :js => true do

    visit "/"

    page.find(".so_id_1 > div > div > h3").click

    wait_for_animation
    wait_for_ajax

    page.find(".app_id_1 > div > div > h3").click

    wait_for_animation

    click_on "new-shortcut-btn"

    expect(page).to have_selector('h2', :text => "Create Shortcut")

    fill_in "Name", with: "Copy"
    fill_in "Description", with: "Copy something"

    page.find(".c67").click
    first(".command").click

    click_on "Clean"

    expect(page).to have_field("Shortcut", :with => '')
  end

end