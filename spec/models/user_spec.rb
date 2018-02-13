require 'rails_helper'

RSpec.describe User, type: :model do
	# initiate new user
	let(:user) {User.new}

	# test new account without Username, expacted to be invalid
	it "is not valid without a username" do
		expect(user).not_to be_valid
	end

	# test username min length
	it "must have at least 5 chars in username" do
		user.username = 'a' * 4
		expect(user).not_to be_valid
	end

	# test username max length
	it "must have no more than 25 chars in username" do
		user.username = 'a' * 26
		expect(user).not_to be_valid
	end
	
	# test password min length
	it "must have at least 6 chars in password" do
		user.password = 'a' * 5
		expect(user).not_to be_valid
	end

	#test password max length
	it "must have no more than 25 chars in password" do
		user.password = 'a' * 26
		expect(user).not_to be_valid
	end
end