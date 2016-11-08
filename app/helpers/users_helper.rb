module UsersHelper
  def user_has_comments?()
    current_user.comments.count > 0 ? true : false
  end

  def user_has_posts?()
    current_user.posts.count > 0 ? true : false
  end
end
