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
    # expect(user.books.last.attributes.slice('title', 'price', 'author')).to eq book.title.downcase
    # expect(user.books.last.title).to eq book.title.downcase
    # expect(user.books.last.price).to eq book.price.downcase
    # expect(user.books.last.author).to eq book.author.downcase
  end
  scenario 'book status after create' do
    create_book(rich_user, book)
    expect(rich_user.books.last.status).to eq 'for_sale'
  end
  scenario 'book status after bought by user whith enough money?' do
    create_book(rich_user, book)
    find('a', id:'buy').click
    within(find('div', id:'update')){find('input').click}
    expect(rich_user.books.last.status).to eq 'delivery'
  end
  scenario 'book status after bought by user whith not enough money?' do
    create_book(user, book)
    find('a', id:'buy').click
    within(find('div', id:'update')){find('input').click}
    expect(user.books.last.status).to eq 'payment'
  end
end