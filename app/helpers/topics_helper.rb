module TopicsHelper
  def user_is_authorized_for_topics?
      current_user && current_user.admin?
  end

  def user_is_authorized_for_topic_action?(action)
      case action
        when "edit"
          current_user && (current_user.admin? || current_user.moderator?)
        else
          current_user && current_user.admin?
      end

  end
end
