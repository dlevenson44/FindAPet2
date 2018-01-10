class UsersController < ApplicationController

	before_action :ensure_signed_out, only: [:new, :create]
	before_action :ensure_signed_in, only: [:show, :index]

	def index
		@user = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(create_params)

		if @user.save
			sign_in(@user)
			flash[:notice] = 'You have successfully signed in.'
			redirect_to "/"
		else
			flash[:error] = @user.errors.full_messages.join(', ')
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private

	def create_params
		params.require(:user).permit(:username, :password)
	end
end
