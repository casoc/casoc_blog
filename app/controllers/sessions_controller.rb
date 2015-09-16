class SessionsController < ApplicationController

  def new
    render layout: nil
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    remember_me = params[:session][:remember_me]
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      remember_me(user) if params[:session][:remember_me].to_i == 1
      redirect_to root_path
    else
      flash.now[:error] = '邮箱不存在或密码错误'
      render 'new', layout: nil
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
