module PostsHelper
  def post_editable(post)
    link_to("Edit", edit_post_path(post), class: "btn btn-mini") if post.user == current_user
  end

  def vote_factor(post)
    post.plus_vote_count - post.minus_vote_count
  end
end
