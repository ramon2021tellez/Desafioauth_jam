class SessionsController < ApplicationController
  def new

  end

  def create
     user = User.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
      session[:user_id] = user.index
      redirect_to root_path, notice: 'logeado correctamente'
     else
      flash.now[:notice] = 'email o password invalida'
      render action: :new
     end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'signed out successfully'
  end
end
