require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'user has all required fields' do
      @user = User.new(
        first_name: 'Brendan',
        last_name: 'Walker',
        email: 'chester@lester.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end
    it 'user must confirm password' do
      @user = User.new(
        first_name: 'Brendan',
        last_name: 'Walker',
        email: 'chester@lester.com',
        password: 'chester',
        password_confirmation: 'lester'
      )
      expect(@user.password).to_not eq(@user.password_confirmation)
      expect(@user).to_not be_valid
    end
    it 'user must have a unique email' do
      @user = User.create(
        first_name: 'Brendan',
        last_name: 'Walker',
        email: 'chester@lester.com',
        password: 'chester',
        password_confirmation: 'chester'
      )
      @user2 = User.create(
        first_name: 'Glinkus',
        last_name: 'Rex',
        email: 'chester@lester.com',
        password: 'password',
        password_confirmation: 'password'
      )

      expect(@user.email).to eq(@user2.email)
      expect(@user2).to_not be_valid
    end
    it 'password must have minimum length of 6 characters' do
      @user = User.create(
        first_name: 'Brendan',
        last_name: 'Walker',
        email: 'chester@lester.com',
        password: 'pass',
        password_confirmation: 'pass'
      )
      expect(@user).to_not be_valid
    end
  end
end
