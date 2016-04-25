require 'rails_helper'

RSpec.feature "Creating App" do

  scenario "successful on creating a App", :js => true do

    so = FactoryGirl.create(:so)

    # so.save!

    a = So.find_by_id(1)

    expect(a).to eq(so)

    visit "/"

    page.save_screenshot('screenshot.png')

    page.find(".so_id_1").click

    click_on "new-app-btn"

    print page.html

    # visit so_apps_path(so)


    # expect(pge).to must_be()
    expect(page).to have_title(('Create App'))

    # fill_in "Name", with: "Eclipse"
    # attach_file('so_img', File.absolute_path('./app/assets/images/profile.png'))
    #
    # click_on "Create App"
    #
    # expect(page).to have_css(".app-name", :text => "Eclipse")
    # expect(page).to have_selector('#notice', visible: false, :text => "App created successfully!")
  end



end