class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :delete]
  before_action :authenticate_user!, only: [:index]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.recipient = @message.book.order.user if @message.book.present?
    #TODO Fix Order and book link
    respond_to do |format|
      if @message.save
          if params[:images].present? && params[:images]['image'].present?
            params[:images]['image'].each do |src|
              @image = @message.book.images.create!(
                  title: @message.book.title,
                  owner: @message.book.user.login,
                  image: src
              )
            end
            @message.book.save
            @message.book.update(status: :control)
          end
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
    @message = Message.where(sender: current_user).or(Message.where(recipient: current_user)).page(params[:page])
  end

  def update
  end

  def delete
  end

  private

  def message_params
    params.require(:message).permit(:message, :book_id, :sender_id, :recipient_id,
                                    images_attributes: [:id, :books_id, :image])
                                    #books_attributes:[:book_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
