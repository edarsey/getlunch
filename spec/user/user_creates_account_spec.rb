require 'rails_helper'
require 'street_address'

feature 'User signs up for an account', js: true do
  let(:check) { FactoryGirl.build(:user) }
  let(:three) { User.new(email: "me1@memail.com", first_name: "Paul", last_name: "Johnson", password: "passwo34", address: "123 Somewhere St, Anywhere, MA, 10192") }

  scenario 'user signs up successfully' do
    visit root_path
    within ('div.top-bar-left') do
      click_on "Sign Up"
    end
    within('div#signUp') do
      fill_in "First Name", with: check.first_name
      fill_in "Last Name", with: check.last_name
      fill_in "Email", with: check.email
      fill_in "Password", with: check.password
      fill_in "Password Confirmation", with: check.password
      fill_in "Address", with: check.address
      click_on "Create Account"
    end

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'user signs up successfully' do
    visit root_path
    within ('div.top-bar-left') do
      click_on "Sign Up"
    end
    within('div#signUp') do
      fill_in "First Name", with: three.first_name
      fill_in "Last Name", with: three.last_name
      fill_in "Email", with: three.email
      fill_in "Password", with: three.password
      fill_in "Password Confirmation", with: three.password
      fill_in "Address", with: three.address
      click_on "Create Account"
    end

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'user forgets to confirm password' do
    visit root_path
    within('div.signup') do
      fill_in "First Name", with: three.first_name
      fill_in "Last Name", with: three.last_name
      fill_in "Email", with: three.email
      fill_in "Password", with: three.password

      fill_in "Address", with: three.address
      click_on "Sign Up"
    end

    expect(page).to_not have_content "Welcome! You have signed up successfully."
  end

  scenario "user doesn't include address" do
    visit root_path
    within('div.signup') do
      fill_in "First Name", with: three.first_name
      fill_in "Last Name", with: three.last_name
      fill_in "Email", with: three.email
      fill_in "Password", with: three.password
      fill_in "Password Confirmation", with: three.password

      click_on "Sign Up"
    end

    expect(page).to_not have_content "Welcome! You have signed up successfully."
  end

  scenario 'user forgets email' do
    visit root_path
    within('div.signup') do
      fill_in "First Name", with: check.first_name
      fill_in "Last Name", with: check.last_name

      fill_in "Password", with: check.password
      fill_in "Password Confirmation", with: check.password
      fill_in "Address", with: check.address
      click_on "Sign Up"
    end

    expect(page).to_not have_content "Welcome! You have signed up successfully."
  end

  scenario 'user zip code is incorrect' do
    address_new = StreetAddress::US.parse(three.address)
    visit root_path
    within('div.signup') do
      fill_in "First Name", with: three.first_name
      fill_in "Last Name", with: three.last_name
      fill_in "Email", with: three.email
      fill_in "Password", with: three.password
      fill_in "Password Confirmation", with: three.password
      fill_in "Address", with: address_new.number + " " + address_new.street + " " + address_new.street_type
      click_on "Sign Up"
    end

    expect(page).to_not have_content "Welcome! You have signed up successfully."
  end
end
