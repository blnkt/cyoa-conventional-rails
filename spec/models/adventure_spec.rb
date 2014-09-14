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
end