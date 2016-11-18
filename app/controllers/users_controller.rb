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

  def current_lots
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
