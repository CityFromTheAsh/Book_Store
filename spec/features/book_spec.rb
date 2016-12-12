require 'rails_helper'
feature 'Book management' do
  let(:rich_user) do
    create(:rich_user)
  end
  let(:user) do
    create(:user)
  end
  let(:book) do
    create(:book)
  end
  scenario 'create new book' do
    create_book(user, book)
    puts user.books.last.attributes.slice('title', 'price', 'author')
  end
  scenario 'check book status after book create' do
    create_book(user, book)
    expect(user.books.last.status).to eq 'for_sale'
  end
  scenario 'check book status after bought by user whith enough money?' do
    create_book(user, book)
    user_logout
    user_login(rich_user)
    visit book_path(user.books.last.id)
    find('a', id:'buy').click
    within(find('div', id:'update')){find('input').click}
    expect(rich_user.books.last.status).to eq 'delivery'
    end
  scenario 'check book status after bought by user whith not enough money?' do
    create_book(user, book)
    find('a', id:'buy').click
    within(find('div', id:'update')){find('input').click}
    expect(user.books.last.status).to eq 'payment'
  end
end