class UsersController < ApplicationController

  before_action :ensure_signed_out, only: [:new, :create]
  before_action :ensure_signed_in, only: [:show, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)

    if @user.save
      sign_in(@user)
      flash[:notice] = 'You are signed in!'
      redirect_to users_path
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def index
    @users = User.all
    @pets = current_user.pets
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def create_params
    params.require(:user).permit(:username, :password, :f_name, :l_name, :address, :city, :state, :zip, :phone, :email)
  end
end
