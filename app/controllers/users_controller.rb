class UsersController < ApplicationController
  before_action: set_user only [:create, :edit, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user
      flash[:success] = "Welcome to Barbershop+!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @user = User.all
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :avatar)
  end

end
