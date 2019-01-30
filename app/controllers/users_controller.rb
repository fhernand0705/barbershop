class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

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
      redirect_to new_user_path
    end
  end

  def show
    @appts = Appointment.all
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to users_path(@user)
  end

  def index
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
      format.js
    end
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
                                 :shop_id,
                                 {role_ids: []})
  end
end
