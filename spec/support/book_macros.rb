module BookMacros
  def create_book(user,  book)
    user_login(user)
    visit new_book_path
    fill_in 'book_title', with: book.title
    fill_in 'book_price', with: book.price
    fill_in 'book_author', with: book.author
    find('input', id: 'submit').click
  end
end