require 'rails_helper'

RSpec.feature "F1 click on shortcut create" do

  before(:each) do
    so = FactoryGirl.create(:so, name: "Macbook")
    FactoryGirl.create(:app, so: so)
    so2 = FactoryGirl.create(:so, name: "Windows")
    FactoryGirl.create(:app, so: so2)
  end

  scenario 'when f1 is clicked, f1 should appear on shortcut field (MAC keyboard)', :js => true do

    visit "/"

    page.find(".so_id_1 > div > div > h3").click

    wait_for_animation
    wait_for_ajax

    page.find(".app_id_1 > div > div > h3").click

    wait_for_animation

    click_on "new-shortcut-btn"

    page.find("#fs > li:nth-child(2) > a").click

    expect(page).to have_field("Shortcut", :with => 'F1')
  end

  scenario 'when f1 is clicked, f1 should appear on shortcut field (Windows keyboard)', :js => true do

    visit "/"

    page.find(".so_id_2 > div > div > h3").click

    wait_for_animation
    wait_for_ajax

    page.find(".app_id_2 > div > div > h3").click

    wait_for_animation

    click_on "new-shortcut-btn"

    page.find("#new_shortcut > div.all-pc-keyboard > div > div.section-a > div:nth-child(2)").click

    expect(page).to have_field("Shortcut", :with => 'F1')
  end

end