class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :ban]

  def index
    @users = User.all
    @users = @users.page(params[:page])
  end

  def edit
  end

  def show
    @status = {
        sale: 'for sale',
        payment: 'waiting for payment',
        delivery: 'awaiting delivery',
        control: 'awaiting control of the reliability and completion of the transaction'
    }
    @counts = {
        for_sale: count(@status[:sale]),
        waiting_for_payment: count(@status[:waiting_for_payment]),
        awaiting_delivery: count(@status[:delivery]),
        awaiting_control: count(@status[:control])
    }
  end

  def sold
  end

  def reviews
  end

  def ban
    @user.update(ban: !@user.ban)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render json: {}, status: :ok }
    end

  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def count(status)
    @user.books.where(status: status).length
  end
end
