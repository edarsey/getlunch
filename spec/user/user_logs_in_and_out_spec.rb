require 'rails_helper'
require 'street_address'

describe 'sign in and sign out features'  do
  let(:check) { FactoryGirl.create(:user) }
  let(:three) { User.new(email: "me1@memail.com", first_name: "Paul", last_name: "Johnson", password: "passwo34", address: "123 Somewhere St, Anywhere, MA, 10192") }

  feature 'User signs in to an account' do
    scenario 'user signs in successfully' do
      visit root_path
      within('div.login') do
        fill_in "Email", with: check.email
        fill_in "Password", with: check.password
        click_on "Log In"
      end

      expect(page).to have_content "Signed in successfully."
    end

    scenario 'user needs to sign up' do
      visit root_path
      within('div.login') do
        fill_in "Email", with: three.email
        fill_in "Password", with: three.password
        click_on "Log In"
      end

      expect(page).to have_content "Invalid email or password."
    end

    scenario 'user puts in wrong password' do
      visit root_path
      within('div.login') do
        fill_in "Email", with: check.email
        fill_in "Password", with: "password"
        click_on "Log In"
      end

      expect(page).to have_content "Invalid email or password."
    end
  end

  feature 'User signs out of account' do
    pending 'user signs out sucessfully' do

    end
  end
end
