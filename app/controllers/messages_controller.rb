class MessagesController < ApplicationController
  before_action :set_message, only:[:show, :update, :delete]

  def new
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Order was successfully created.' }

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
    #@messages = Message.all
  end

  def update
  end

  def delete
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
  def set_message
    @message = Message.find(params[:id])
  end
end
