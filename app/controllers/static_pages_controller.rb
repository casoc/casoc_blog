class StaticPagesController < ApplicationController
  
  def home
    #user_name = params[:user_name]
    #user = User.find_by(user_name: user_name)
    @articles = Article.order('updated_at desc').limit(5)
  end

  def about

  end

  def contact

  end

end
