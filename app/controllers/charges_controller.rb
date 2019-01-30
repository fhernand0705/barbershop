class ChargesController < ApplicationController
  def new
    @total = 1500
  end

  def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  @user = User.find(session[:user_id])
  redirect_to current_user

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_appointment_path
  end
end
