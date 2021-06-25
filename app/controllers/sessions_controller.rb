class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  VERIFY_TEXT = 'Are you a Guru? Verify your email and password please'.freeze

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:user_path] || tests_path
    else
      flash.now[:alert] = VERIFY_TEXT
      render :new
    end
  end

  def destroy
    session.delete(:user_id) if session[:user_id]
    redirect_to root_path
  end
end
