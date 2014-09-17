require 'rails_helper'

describe "the addition of new episode to a chapter process" do
  it "gives a user an error if the prompt field is blank" do
    @blnkt = FactoryGirl.create(:user)
    @adventure = FactoryGirl.create(:adventure)
    @chapter = FactoryGirl.create(:chapter)
    @adventure.update(user_id: @blnkt.id)
    @adventure.add_chapter(@chapter)
    @chapter.add_choice('hey you guys!')
    @new_chapter = @chapter.choices.first
    visit '/users/sign_in'
    fill_in 'Name', with: 'blnkt'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/adventures/#{@adventure.id}/chapters/#{@new_chapter.id}"
    fill_in 'chapter[episode]', with: ''
    click_button 'add episode'
    expect(page).to have_content 'cannot be blank'
  end

  it "user successfully adds a new episode" do
    @blnkt = FactoryGirl.create(:user)
    @adventure = FactoryGirl.create(:adventure)
    @chapter = FactoryGirl.create(:chapter)
    @adventure.update(user_id: @blnkt.id)
    @adventure.add_chapter(@chapter)
    @chapter.add_choice('hey you guys!')
    @new_chapter = @chapter.choices.first
    visit '/users/sign_in'
    fill_in 'Name', with: 'blnkt'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/adventures/#{@adventure.id}/chapters/#{@new_chapter.id}"
    fill_in 'chapter[episode]', with: 'this is an episode'
    click_button 'add episode'
    expect(page).to have_content 'commited'
  end

end