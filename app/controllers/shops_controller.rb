class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :show, :update]

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.valid?
       @shop.save
       flash[:notice] = "#{@shop.name} created!"
       redirect_to shops_path
    else
       render 'shops/new'
    end
  end

  def show
    @services = Service.all
  end

  def edit
  end

  def update
    @shop.update(shop_params)
    redirect_to shops_path(@shop)
  end

  def index
    @shops = Shop.all
  end

  def destroy
    @shop = User.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name,
                                 :address,
                                 :phone)
  end
end
