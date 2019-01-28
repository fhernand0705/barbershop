class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :show, :update]

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.valid?
       @service.save
       flash[:success] = "#{@service.name} added to list of services!"
       redirect_to service_path(@service)
    else
      render 'services/new'
    end
  end

  def show
  end

  def edit
  end

  def index
    @service = Service.all
  end

  def destroy
    @service = Service.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :price)
  end
end
