class OptionsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @option = current_user.option
  end

  def edit

  end
  def update
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

  def option_params
    params.require(:option).permit(:book_per_page, :language)
  end
end
