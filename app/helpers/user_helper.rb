module UserHelper
  def admin?(current_user)
    return true if current_user.present? && current_user.admin
    false
  end
end
