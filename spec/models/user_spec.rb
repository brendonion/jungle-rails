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
        email: 'cHEster@lester.com',
        password: 'password',
        password_confirmation: 'password'
      )
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
  describe '.authenticate_with_credentials' do
    it 'is a valid email in the database' do
      @user = User.create(
        first_name: 'Brendan',
        last_name: 'Walker',
        email: 'chester@lester.com',
        password: 'password',
        password_confirmation: 'password'
      )

      theUser = User.find_by(email: @user.email)
      expect(theUser).to be_valid
    end
    it 'has a password bcrypt match in the database' do
      @user = User.create(
        first_name: 'Brendan',
        last_name: 'Walker',
        email: 'chester@lester.com',
        password: 'password',
        password_confirmation: 'password'
      )
      theUser = User.authenticate_with_credentials(@user.email, @user.password)
      expect(theUser).to be_valid
    end
    it 'users can log in with spaces before and/or after email (case sensitivity is false)' do
      @user = User.create(
        first_name: 'Brendan',
        last_name: 'Walker',
        email: 'chester@lester.com',
        password: 'password',
        password_confirmation: 'password'
      )
      theUser = User.authenticate_with_credentials('  cheSTER@lester.com  ', @user.password)
      expect(theUser).to be_valid
    end
  end
end








