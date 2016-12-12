module UserHelper
  def admin?(current_user)
    return true if current_user.present? && current_user.admin
    false
  end
  def have_permission_for_edit_book?(book, current_user)
    return true if admin?(current_user) || (current_user.present? && current_user.login == book.owner)
    false
  end
end
