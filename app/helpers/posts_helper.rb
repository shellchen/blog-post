module PostsHelper
  def post_editable(post)
    link_to("Edit", edit_post_path(post), class: "btn btn-mini") if post.user == current_user
  end

  def post_vote_factor(post)
    post.plus_vote_count - post.minus_vote_count
  end

  def comment_vote_factor(comment)
    comment.plus_vote_count - comment.minus_vote_count
  end
end
