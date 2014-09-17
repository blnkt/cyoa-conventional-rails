require 'rails_helper'

describe Adventure do

	it { should belong_to :user }
	it { should have_and_belong_to_many :chapters }
	it { should validate_presence_of :user_id }

	describe "#add_chapter" do
	  it "add a chapter to an adventure" do
		  @chapter = FactoryGirl.create(:chapter)
	    @adventure = FactoryGirl.create(:adventure)
	  	@adventure.add_chapter(@chapter)
	    expect(@adventure.chapters.last).to eq(@chapter)
	  end
	end

  describe "#progress" do
	  it "an editted list of a user's progress through available chapters in a given adventure" do
		  @chapter = FactoryGirl.create(:chapter)
	    @adventure = FactoryGirl.create(:adventure)
	  	@adventure.add_chapter(@chapter)
	  	@adventure.add_chapter(@chapter)
	    expect(@adventure.progress).to eq([@chapter])
	  end
	end

	  describe "#prologue" do
		  it "instatiates the prologue if it does not already exist" do
		    new_adventure = Adventure.create(user_id: 1, title: 'test_adventure')
		    expect(Chapter.all.first.prompt).to eq("Welcome to the Adventure")
		  end
		end
end