class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_book_counts

  def set_book_counts
    if current_user.present?
      grouped_count = current_user.books.group(:status).count
      @book_counts = Book.status.values.map do |status|
        [status.to_sym, grouped_count[status.to_s].to_i]
      end.to_h
    end
  end
end