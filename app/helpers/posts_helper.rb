module PostsHelper
  def post_editable(post)
    link_to("Edit", edit_post_path(post), class: "btn btn-mini") if post.user == current_user
  end
end
