require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  before(:each) do
    visit new_session_path
  end

  feature 'Log In' do
    scenario 'has a log in page' do
      expect(page).to have_content('Log In')
    end

    scenario 'takes a Username and Password' do
      expect(page).to have_content('Username')
      expect(page).to have_content('Password')
    end

    scenario 'redirects to comments index and shows username' do
      fill_in 'Username', with: 'moistie'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
      expect(current_path).to eq(comments_path)
      expect(page).to have_content('moistie')
    end
  end

  feature 'Log Out' do
    User.destroy_all
    User.create!(username: 'moistie', password: 'password')

    before(:each) do
      fill_in 'Username', with: 'moistie'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
    end

    scenario 'log out button is present and redirects to log in page' do

      click_button 'Log Out'
      expect(current_path).to eq(new_session_path)
    end

    scenario 'doesn\'t show username after log out' do
      click_button 'Log Out'
      expect(page).not_to have_content('moistie')
    end
  end
end
