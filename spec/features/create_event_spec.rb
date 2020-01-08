require 'rails_helper'
 
	RSpec.describe 'Creating an event', type: :feature do
	  scenario 'valid inputs' do
	  	login_with 'mike'
	    visit new_event_path
	    fill_in "event_name", with: "Miss"
	    fill_in "event_event_date", with: DateTime.current.strftime("%d/%m/%Y")
	    click_on "Save changes"
	    visit events_path
	    expect(page).to have_content("Miss")
	  end

	  scenario 'invalid inputs' do
	  	login_with 'mike'
	    visit new_event_path
	    fill_in "event_name", with: "Miss"
	    fill_in "event_event_date", with: ""
	    click_on "Save changes"
	    visit events_path
	    expect(page).not_to have_content("Miss")
	  end

	  def login_with(username)
	    visit login_path
	    fill_in 'session_username', with: username
	    click_button 'Log in'
	  end

  end