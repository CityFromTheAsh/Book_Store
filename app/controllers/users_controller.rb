class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  end

  def show
  end

  def sold
  end

  def reviews
  end

  def current_lots
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
