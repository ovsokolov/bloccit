module SponsoredPostsHelper
  def user_is_authorized_for_post_action?(post, action)
    case action
      when "edit"
        current_user && (current_user.admin? || current_user.moderator?)
      else
        current_user && current_user.admin?
    end
  end
end
