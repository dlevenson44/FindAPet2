require 'rails_helper'

RSpec.describe Pet, type: :model do
	let(:pet) {Pet.new}

	it "must have a name" do
		pet.name = ''
		expect(pet).not_to be_valid
	end
	
	it "must have a post_type" do
		pet.post_type = ''
		expect(pet).not_to be_valid
	end
	
	it "must have a animal" do
		pet.animal = ''
		expect(pet).not_to be_valid
	end
	
	it "must have a breed" do
		pet.breed = ''
		expect(pet).not_to be_valid
	end
	
	it "must have a age" do
		pet.age = ''
		expect(pet).not_to be_valid
	end

	it "must have a description" do
		pet.description = ''
		expect(pet).not_to be_valid
	end

end