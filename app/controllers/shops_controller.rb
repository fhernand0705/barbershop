class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :show, :update]

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.valid?
      @shop.save
      redirect_to shops_path, :flash => { :success => "#{@shop.name} created!" }
    else
      render 'shops/new'   
  end

  def show
  end

  def edit
  end

  def update
    @shop.update(shop_params)
    redirect_to shops_path(@shop)
  end

  def index
    @shop = Shop.all
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
    params.require(:shop).premit(:name,
                                 :address,
                                 :phone)
  end
end
