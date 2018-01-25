require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
  	@pet = pets(:Pringle)
  end

  test "unsuccessful edit" do
  	get edit_pet_path(@pet)
  	assert_template 'pets/edit'
  	patch pet_path(@pet), params: {pet: { 
  		name: "",
  		age: "test",
  		description: ""
  		}}
  	assert_template 'pets/edit'
  end
end
