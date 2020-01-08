require 'rails_helper'

RSpec.describe 'Visitor signs up', type: :feature do
   scenario 'with valid email and username' do
    sign_up_with 'mikey@gmail.com', 'mikey'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'mikey'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank username' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

  def sign_up_with(email, username)
    visit signup_path
    fill_in 'user_username', with: username
    fill_in 'user_email', with: email
    click_button 'Save changes'
  end
end