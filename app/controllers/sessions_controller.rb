class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][email:].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirecto_to user
    else
      flash.now[:danger] = 'Oh no...invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
