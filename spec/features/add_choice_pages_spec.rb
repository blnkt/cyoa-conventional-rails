require 'rails_helper'

describe "the addition of new choices to a chapter process" do
  it "gives a user an error if the prompt field is blank" do
    @blnkt = FactoryGirl.create(:user)
    @adventure = FactoryGirl.create(:adventure)
    @chapter = FactoryGirl.create(:chapter)
    @adventure.update(user_id: @blnkt.id)
    @adventure.add_chapter(@chapter)
    visit '/users/sign_in'
    fill_in 'Name', with: 'blnkt'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/adventures/#{@adventure.id}/chapters/new"
    fill_in 'chapter[prompt]', with: ''
    click_button 'enter this choice'
    expect(page).to have_content 'cannot be blank'
  end

  it "user successfully adds a new choice" do
    @blnkt = FactoryGirl.create(:user)
    @adventure = FactoryGirl.create(:adventure)
    @chapter = FactoryGirl.create(:chapter)
    @adventure.update(user_id: @blnkt.id)
    @adventure.add_chapter(@chapter)
    visit '/users/sign_in'
    fill_in 'Name', with: 'blnkt'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/adventures/#{@adventure.id}/chapters/new"
    fill_in 'chapter[prompt]', with: 'hey, this is a new choice'
    click_button 'enter this choice'
    expect(page).to have_content 'branch'
  end

end