class Book < ApplicationRecord
  extend Enumerize

  has_many :images
  has_many :messages
  belongs_to :user
  has_one :order
  accepts_nested_attributes_for :images

  enumerize :binding, in: {hardcover: true, softcover: false}
  enumerize :status, in: %w(for_sale payment delivery control sold banned)

  paginates_per 5
  max_paginates_per 5

  validates :title, :price, :author, presence: true

    scope :last_books_created, -> do
      raw_sql = 'SELECT users.login, books2.title FROM
      (
      SELECT MAX(books1.created_at) AS last_time_books_creating
      FROM books books1
      INNER JOIN users ON users.id = books1.user_id
      GROUP BY users.login
      ) find_last_books
      INNER JOIN books as books2 ON books2.created_at = find_last_books.last_time_books_creating
      INNER JOIN users on books2.user_id = users.id
      GROUP BY users.login, books2.title;'
      # desired_time = "MAX(created_at)"
      # single = ('('+(select.('MAX(created_at) as last_created').joins(:users).group('users.login')).to_s+') as single').to_sql
      # full_book = single.joins('INNER JOIN books ON books.created_at = single.last_created')
    end
end
