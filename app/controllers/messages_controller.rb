class MessagesController < ApplicationController
  before_action :set_message, only:[:show, :update, :delete]
  before_action :authenticate_user!, only: [:index]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def index
    @message = Message.where(sender: current_user)
    @message << Message.where(recipient: current_user) if Message.where(recipient: current_user).present?
    @message = @message.page(params[:page])
    end

  def update
  end

  def delete
  end

  private

  def message_params
    params.require(:message).permit(:message, :book_id, :sender_id)
  end
  def set_message
    @message = Message.find(params[:id])
  end
end
