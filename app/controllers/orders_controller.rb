class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :check_book, except: [:index, :create, :update]
  before_action :authenticate_user!, all:

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @book = Book.find(params[:book_id])
    BookMailer.notification_about_order(@book, @book.user).deliver
    if @book.order.nil?
      @book.order = Order.new(book: @book, buyer: current_user.login,  admin: "new admin")
    else
      @book.order.buyer = current_user.login
    end
    @book.order.save
    @order = @book.order
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new()
    @order.book.update(status: "waiting for payment")
    respond_to do |format|
      if @order.save
        puts '----------------------------------------------'
        puts @order.book.to_json
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
        @order.book.update(status: :payment)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:buyer, :admin)
  end

  def check_book
    redirect_to books_path if params[:book_id].nil?
  end
end
