require 'rails_helper'

  DatabaseCleaner.clean

  @adventure = FactoryGirl.create(:adventure)
  @chapter = FactoryGirl.create(:chapter)

describe "the signin process" do
  it "gives a user an error who uses the wrong password" do
    visit '/users/sign_in'
    fill_in 'Name', with: 'bink'
    fill_in 'Password', with: 'wrong'
    click_button 'Log in'
    expect(page).to have_content 'Invalid'
  end

  it "signs a user in who uses the right password" do
    @blnkt = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Name', with: 'blnkt'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'account'
  end

end