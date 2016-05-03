require 'faker'

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "person#{n}@example.com" }
    password "password"
    address Faker::Address.street_address + ", " + Faker::Address.city + ", "+ Faker::Address.state_abbr + ", " + Faker::Address.zip
  end
end
