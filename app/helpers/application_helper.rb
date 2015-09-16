module ApplicationHelper

  def users_channel?
    controller_name == "users"
  end

  def articles_channel?
    controller_name == "articles"
  end

  def categories_channel?
    controller_name == "categories"
  end

  def galleries_channel?
    controller_name == "galleries"
  end

  def comments_channel?
    controller_name == "comments"
  end

  def is_home_page?
    controller_name == "static_pages" && action_name == "home"
  end

end
