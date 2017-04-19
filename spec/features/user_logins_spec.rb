require 'rails_helper'

RSpec.feature "User can successfully log in", type: :feature, js: true do
  before :each do
    User.create!(
      first_name: 'Chester',
      last_name: 'Lester',
      email: 'chester@lester.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  scenario 'User redirects to home page after log in' do
    
    visit '/login' 
    
    fill_in 'email', with: 'chester@lester.com'
    fill_in 'password', with: 'password'

    click_on('Submit')

    expect(page).to have_css '.products-index'

  end
end
