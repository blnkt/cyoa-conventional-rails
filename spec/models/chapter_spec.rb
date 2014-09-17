require 'rails_helper'

describe Chapter do
	it { should have_and_belong_to_many :adventures}
	it { should have_one  :parent }
	it { should validate_presence_of :prompt }

	describe '#add_choice' do
	  it "add a choice to a chapter" do
	  	parent_chapter = FactoryGirl.create(:chapter)
	    parent_chapter.add_choice("sex")
	    expect(Chapter.find_by(parent_id: parent_chapter.id).prompt).to eq("sex")
	  end

	  it "add a choice to a chapter unless the prompt is nil" do
	  	new_chapter = Chapter.create(prompt: "it was a dark and stormy night")
	    new_chapter.add_choice("")
	    expect(Chapter.find_by(parent_id: new_chapter.id)).to eq(nil)
	  end
	end

  describe '#choices' do
	  it "return all the chapters with a target chapter's id as their parent_id (i.e. all a target chapters choices)" do
      parent_chapter = FactoryGirl.create(:chapter)
	    parent_chapter.add_choice("sex")
	    parent_chapter.add_choice("rock & roll")
	    choices = []
	    parent_chapter.choices.each { |choice| choices << choice.prompt }
      expect(choices).to eq(["sex", "rock & roll"])
    end
  end
end