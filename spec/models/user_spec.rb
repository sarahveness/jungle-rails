require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user1) { User.create(name: 'Sarah', email: 'sarah@sarah.com', password: 'hellohello', password_confirmation: 'hellohello') }

  let (:user2) { User.create(name: 'Bob', email: 'SARAH@sarah.COM', password: 'password', password_confirmation: 'password') }

  let (:user3) { User.create(name: 'Dave', email: '   dave@dave.com      ', password: 'google', password_confirmation: 'google222') }

    let (:user4) { User.create(name: 'Rob', email: 'sarah@sarah.com', password: 'google', password_confirmation: 'google222') }

it 'password should be longer than 6 characters' do
  expect(user1.password.length).to be > 6
end

it 'password and password confirmation should match' do
  expect(user1.password). to eq(user1.password_confirmation)
end

it 'password and password confirmation do not match' do
  expect(user3.password).not_to eq(user3.password_confirmation)
end

it 'emails should be unique' do
    user1.save
    user2.save
    expect(user2).to_not(be_valid)
end

end


