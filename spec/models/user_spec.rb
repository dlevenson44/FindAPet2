require 'rails_helper'

RSpec.describe User, type: :model do
	# initiate new user
	let(:user) {User.new}

	# test new account without Username, expacted to be invalid
	it "is not valid without a username" do
		expect(user).not_to be_valid
	end
end