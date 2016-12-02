class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :cont_start
  def cont_start
    if current_user.present?
      @counts = {
          for_sale: count(current_user, :for_sale),
          payment: count(current_user, :payment),
          delivery: count(current_user, :delivery),
          control: count(current_user, :control),
          sold: count(current_user, :sold),
          banned: count(current_user, :banned)
      }
    end

  end
  private
  def count(user, status)
    user.books.where(status: status).length
  end
end