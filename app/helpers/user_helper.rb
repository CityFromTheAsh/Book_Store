module UserHelper
  def admin?(current_user)
    return true if current_user.present? && current_user.admin
    false
  end
  def permission?(book, current_user)
    return true if admin?(current_user) || (current_user.present? && current_user.login==book.owner)
    false
  end
end
