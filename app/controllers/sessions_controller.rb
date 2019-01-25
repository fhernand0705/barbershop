class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][email:].downcase)
    if user && user.authenticate(params[:session][:password])
      # login user and redirect to dashboard page
    else
      flash.now[:danger] = 'Oh no...invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sessions[:id] = nil
  end

end
