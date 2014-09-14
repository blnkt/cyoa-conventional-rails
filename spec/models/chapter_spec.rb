require 'rails_helper'

describe Chapter do

	it { should have_and_belong_to_many :adventures}
	it { should have_one  :parent }
	it { should validate_presence_of :prompt }

end