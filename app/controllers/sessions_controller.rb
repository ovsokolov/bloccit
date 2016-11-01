class SessionsController < ApplicationController
  def new
  end

  def create
    #params.require(:sessionx)
    user = User.find_by(email: params[:sessionx][:email].downcase)
    #byebug
    if user && user.authenticate(params[:sessionx][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
  # #3
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
