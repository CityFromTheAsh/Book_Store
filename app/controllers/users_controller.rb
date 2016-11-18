class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  require 'carrierwave/orm/activerecord'

  def index
    @users = User.all
    @users = @users.page(params[:page])
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
