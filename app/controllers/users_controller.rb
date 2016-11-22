class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :ban]

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

  def ban
    @user.update(ban: false)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render json: {}, status: :ok }
    end

  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
