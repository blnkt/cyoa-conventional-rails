require 'rails_helper'

DatabaseCleaner.clean

describe "the signup process" do
  it "gives a user an error who enters the wrong/amount credentials" do
    visit '/users/sign_up'
    fill_in 'Email', with: 'bozo@bozo.com'
    fill_in 'Name', with: 'bozo'
    fill_in 'Password', with: 'pass'
    click_button 'Sign up'
    expect(page).to have_content 'prohibited'
  end

  it "signup a user who fills out all fields appropriately" do
    visit '/users/sign_up'
    fill_in 'Email', with: 'bozo@bozo.com'
    fill_in 'Name', with: 'blizzard'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'account'
  end

end