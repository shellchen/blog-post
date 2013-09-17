module ApplicationHelper
  def all_or_user_posts_link
    if logged_in?
      link_to(current_user.username, user_path(current_user))
    else
      link_to("All Posts", root_path)
    end
  end

  def login_logout_link
    if logged_in?
      render "shared/logout_button"
    else
      render "shared/login_button"
    end
  end

  def signup_link
    render "shared/signup_button" unless logged_in?
  end

  def new_post_link
    render "shared/new_post_button" if logged_in?
  end
end
