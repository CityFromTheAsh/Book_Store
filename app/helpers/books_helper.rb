module BooksHelper
  def is_admin?(current_user)
    if current_user.present?
      if current_user.admin
        return true
      end
    end
    return false
  end
end
