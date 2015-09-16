module SessionsHelper

  def sign_in(user)
    self.current_user = user
  end

  def remember_me(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_to(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to new_session_path, notice: "请登录"
    end
  end

  def signed_in_admin
    signed_in_user
    if current_user.admin == 1
      sign_out
      redirect_to new_session_path, notice: "权限不足,请登录管理员账号"
    end
  end

end
