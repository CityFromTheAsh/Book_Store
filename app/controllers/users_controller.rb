class UsersController < ApplicationController
  before_action :set_user, only: [:show, :user_books]
  def index
  end
  def show
  end

  def buyed
  end

  def sold
  end

  def reviews
  end
  def user_books
  end
  def current_lots
  end
  private
  def set_user
    @user = User.find(params[:id] ||= params[:user_id])
  end
end
