class PetsController < ApplicationController
	before_action :ensure_signed_in, except: [:index, :show]

	def index
		@pets = Pet.all.order(id: :asc)
	end

	def show
		@pet = Pet.find(params[:id])
		@pets = Pet.all.order(id: :desc)
	end

	def new
		@pet = Pet.new		
	end

	def create
		@pet = Pet.new(pet_params)
		@pet.user = current_user
		if @pet.save
			redirect_to pet_path(@pet)
		else
			render :new
		end
	end

	def edit
		@pet = Pet.find(params[:id])
	end

	def update
		@pet = Pet.find(params[:id])
		if @pet.update(pet_params)
			redirect_to pet_path(@pet)
		else
			redirect_to pet_edit_path(@pet)
		end		
	end

	def destroy
		@pet = Pet.find(params[:id])
		@pet.delete
		redirect_to pets_path
	end

	private
	def pet_params
		params.require(:pet).permit(:name, :post_type, :animal, :breed, :age, :description, :picture)
	end
end