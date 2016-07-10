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

    page.find(".app_id_1 > div > div > h3").click

    click_on "new-shortcut-btn"

    expect(page).to have_selector('h2', :text => "Create Shortcut")



    expect(So.first.name).to eq('Ubuntu')
    expect(App.first.so.name).to eq('Ubuntu')
  end

  scenario 'select the so and app to create a shortcut', :js => true do

    visit "/"

    page.find(".so_id_1 > div > div > h3").click

    click_on "new-shortcut-btn"

    expect(page).to have_selector('.bootstrap-growl', visible: false, :text => "Please select the App")
  end

end