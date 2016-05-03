require 'rails_helper'
require 'street_address'

feature 'User creates a lunchtime', js: true do
  let(:check) { FactoryGirl.create(:user) }
  let(:three) { User.create(email: "me1@memail.com", first_name: "Paul", last_name: "Johnson", password: "passwo34", address: "123 Somewhere St, Anywhere, MA, 10192") }
  let(:lunchtime) { Lunchtime.new(restaurant: "Subway", eattime: Date.current, address: "33 Harrison Ave #501, Boston, MA 02111"  )}

  scenario 'User successfully creates a lunchtime' do
    visit root_path
    login_as_user(three)
    within("body") do
      click_on "New Lunchtime"
      fill_in "Restaurant", with: lunchtime.restaurant
      fill_in "Date and Time", with: lunchtime.eattime
      fill_in "Address", with: lunchtime.address
      click_on "Add Lunchtime"
    end

    expect(page).to have_content "Lunchtime successfully created."
  end
end
