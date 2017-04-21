require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'user_email', with: "email@gmail.com"
      fill_in 'password', with: "password"
      click_on 'submit'
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "email@gmail.com"
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    user = User.create(email: "email@gmail.com", password: "password")
    visit new_sessions_url
    fill_in 'email', with: "email@gmail.com"
    fill_in 'password', with: "password"
    click_on 'submit'

    expect(page).to have_content "email@gmail.com"
  end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    visit users_url
    expect(page).to_not have_button('Log out')
  end

  scenario "doesn't show username on the homepage after logout" do
    visit users_url

    user = User.create(email: "email@gmail.com", password: "password")
    visit new_sessions_url
    fill_in 'email', with: "email@gmail.com"
    fill_in 'password', with: "password"
    click_on 'submit'
    click_on 'Log out'
    expect(page).to_not have_content "email@gmail.com"
  end

end
