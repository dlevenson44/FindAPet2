class UsersController < ApplicationController

  before_action :ensure_signed_out, only: [:new, :create]
  before_action :ensure_signed_in, only: [:show, :index]

  def index
    @users = User.all
    @pets = current_user.pets.order(id: :desc)
    @user = current_user
  end

  def show
    @pet = Pet.find(params[:id])
  end

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

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(create_params)
      redirect_to users_path
    else
      redirect_to user_edit_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])    
    list = @user.pets
    list.each { |f| f.delete }
    @user.delete
    flash[:success] = "User deleted"
    redirect_to root_path
  end



  private

  def create_params
    params.require(:user).permit(:username, :password, :f_name, :l_name, :address, :city, :state, :zip, :phone, :email)
  end
end
