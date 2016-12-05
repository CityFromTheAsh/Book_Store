require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    context 'when book has all needed fields' do
      before(:each) do
        @book = Book.new()
      end
      it "should'nt be valid" do
        expect(@book).not_to be_valid
      end
      it "should'nt be valid" do
        @book.title = 'This_is_test_title'
        expect(@book).not_to be_valid
      end
      it "should'nt be valid" do
        @book.price = 1_000_000
        expect(@book).not_to be_valid
      end
      it "should'nt be valid" do
        @book.author = 'Some_test_book_author'
        expect(@book).not_to be_valid
      end
      it "should be valid" do
        @book.title = 'This_is_test_title'
        @book.price = 1_000_000
        @book.author = 'Some_test_book_author'
        expect(@book).to be_valid
      end
    end
    context 'when book does not have author' do
      before(:each) do
        @book = Book.new()
        @book.title = 'This_is_test_title'
        @book.price = 1_000_000
      end

    end
  end




end
