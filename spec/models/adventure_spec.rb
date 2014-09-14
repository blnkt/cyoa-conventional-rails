require 'rails_helper'

describe Adventure do
	it { should belong_to :user }
	it { should have_and_belong_to_many :chapters }
	it { should validate_presence_of :user_id }
end