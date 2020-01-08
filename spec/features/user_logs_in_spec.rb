require 'rails_helper'

RSpec.describe 'User logs in', type: :feature do
   scenario 'with valid username' do
    login_with 'mike'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid username' do
    login_with 'blabla'

    expect(page).to have_content('Sign in')
  end

  def login_with(username)
    visit login_path
    fill_in 'session_username', with: username
    click_button 'Log in'
  end
end