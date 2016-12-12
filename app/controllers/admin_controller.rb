class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :find_users

  def main_admin
     if current_user.login != 'Weed15'
       redirect_to root_path
     else
       @records_array = ActiveRecord::Base.connection.execute params[:sql_request] if params[:sql_request].present?
     end
  end

  def admin
  end
  private
  def find_users
    @users = User.all.order(:created_at)
  end
end
