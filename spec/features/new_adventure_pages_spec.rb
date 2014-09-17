require 'rails_helper'

describe "the new adventure process" do
  it "gives a user an error if the title field is blank" do
    @blnkt = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Name', with: 'blnkt'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit '/adventures/new'
    fill_in 'Title', with: ''
    click_button 'Create Adventure'
    expect(page).to have_content 'cannot be blank'
  end

  it "user successfully creates an adventure" do
    @blnkt = FactoryGirl.create(:user)
    @chapter = FactoryGirl.create(:chapter)
    visit '/users/sign_in'
    fill_in 'Name', with: 'blnkt'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit '/adventures/new'
    fill_in 'Title', with: 'bubbalicious'
    click_button 'Create Adventure'
    expect(page).to have_content 'Welcome to your adventure'
  end

end