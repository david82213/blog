class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: 'Signed In'
    else
      flash.now[:alert] = 'Wrong credentials'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: 'Signed Out!'
  end
end
