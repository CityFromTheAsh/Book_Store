class OptionsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.update(option: Option.create(user_id: current_user.id)) if current_user.option.nil?
    @option = current_user.option
  end

  def edit
    respond_to do |format|
      if @option.update(option_params)
        format.html { }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  def book_params
    params.require(:option).permit(:book_per_page)
  end
end