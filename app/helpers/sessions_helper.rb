module SessionsHelper
  
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def signed_in_user
      unless signed_in?
        store_location
        redirect_to "/signin"
    end
  end

  def store_location
    session[:return_to] = request.url
  end
  
  def sign_out
      current_user.update_attribute(:remember_token,
                                    User.digest(User.new_remember_token))
      cookies.delete(:remember_token)
      self.current_user = nil
  end
  
  def right_user(current_object)
    redirect_to current_user if current_object.user != current_user 
  end
    
  
end
