class PasswordResetsController < ApplicationController
  def new
    @password = PasswordReset.new
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    password_params = params.require(:passwordreset).permit(:password, :password_confirmation)

    if @user.update password_params
      redirect_to home_path
    else
      render :edit
    end
  end
end
