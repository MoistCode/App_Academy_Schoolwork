require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
  before(:each) do
    visit new_user_path
  end

  feature 'Sign Up' do
    scenario 'has a sign up page' do
      expect(page).to have_content('Sign Up')
    end

    scenario 'takes a Username and Password' do
      expect(page).to have_content('Username')
      expect(page).to have_content('Password')
    end

    scenario 'redirects to comments index and shows username' do
      User.destroy_all
      fill_in 'Username', with: 'moistie'
      fill_in 'Password', with: 'password'
      click_button 'Create New User'
      expect(current_path).to eq(comments_path)
      expect(page).to have_content('moistie')
    end
  end


end
