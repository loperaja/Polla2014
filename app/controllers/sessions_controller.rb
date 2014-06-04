class SessionsController < ApplicationController
  layout 'static_layout'
  skip_before_filter :signed_in_user
  
  def new
    redirect_to current_user if signed_in?
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
