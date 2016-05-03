require 'factory_girl_rails'

10.times do |i|
  FactoryGirl.create(:user)
end

10.times do |i|
  address = Faker::Address.street_address + ", " + Faker::Address.city + ", "+ Faker::Address.state_abbr + ", " + Faker::Address.zip
  Lunchtime.create(user: User.find(1 + i), restaurant: "Place#{i}", address: address, eattime: (Time.now.to_datetime + i.days))

  User.all.each do |user|
    unless Lunchtime.user == user
      Invite.create(lunchtime: Lunchtime.find(1 + i), user: user)
    end
  end
end
