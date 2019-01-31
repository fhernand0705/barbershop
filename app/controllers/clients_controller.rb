class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :show, :update]

  def new
    @client = Client.new
  end

  def create
    @client = User.new(client_params)
    if @client.valid?
       @client.save
       log_in @client
       flash[:success] = "Welcome to Barbershop+!"
       redirect_to @client
    else
      redirect_to new_client_path
    end
  end

  def show
    @appts = Appointment.all
  end

  def edit
  end

  def update
    @client.update(client_params)
    redirect_to clients_path(@client)
  end

  def index
    @client = Client.all
  end

  def destroy
    @client = Client.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :shop_id)
  end
end
