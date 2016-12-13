class Book < ApplicationRecord
  extend Enumerize

  has_many :images
  has_many :messages
  belongs_to :user
  has_one :order
  accepts_nested_attributes_for :images

  enumerize :binding, in: {hardcover: true, softcover: false}
  enumerize :status, in: %w(for_sale payment delivery control sold banned)

  validates :title, :price, :author, presence: true

    scope :last_books_created, -> do


      complex_table_sql = '(SELECT MAX(books1.created_at) AS last_time_books_creating
          FROM books books1
          INNER JOIN users ON users.id = books1.user_id
          GROUP BY users.login) find_last_books'
      Book
          .select('users.login, books2.*')
          .from(complex_table_sql)
          .joins('INNER JOIN books as books2 ON books2.created_at = find_last_books.last_time_books_creating')
          .joins('INNER JOIN users on books2.user_id = users.id')
          .joins('GROUP BY users.login, books2.id')
    end
end
