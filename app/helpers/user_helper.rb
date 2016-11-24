module UserHelper
  def admin?(current_user)
    return true if current_user.present? && current_user.admin
    false
  end
  def permission?(book, current_user)
    return true if admin?(current_user) || (current_user.present? && current_user.login==book.owner)
    false
  end
  def change(user)
    user.ban = !user.ban
    user.save
  end
  def count(books, status)
    return books.where(status: status).length
  end
end
