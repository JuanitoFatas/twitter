class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :destroy], raise: false

  def new
  end

  def create
    user = authenticate_session(session_params, lookup_field_map)

    if sign_in(user)
      redirect_to root_path
    else
      flash.now[:error] = "Invalid credentials."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email_or_username, :password)
  end

  def lookup_field_map
    { email_or_username: [:email, :username] }
  end
end
