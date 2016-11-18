class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  require 'carrierwave/orm/activerecord'

  def index
    @users = User.all
    @users = @users.page(params[:page])
  end

  def edit
  end

  def show
  end

  def sold
  end

  def reviews
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
