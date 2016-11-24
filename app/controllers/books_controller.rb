class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  require 'carrierwave/orm/activerecord'

  # GET /books
  # GET /books.json
  def index


     if params[:search].present?

       search_strings = params[:search].gsub(/[^\w\sА-Яа-я ]/, '')
       fields = Book.columns.select { |c| c.type == :string }.map { |c| c.name }
       where_sql = fields.map { |field| "#{field} LIKE '%#{search_strings}%'" }.join(' OR ')
       @books = Book.where(where_sql)

     else

      @books = Book.all
      @books = @books.where(status: 'for sale')
      @books = @books.where(user_id: params[:user_id]) if params[:user_id].present?
      @books = @books.where(author: params[:book_id]) if params[:book_id].present?
      @books = @books.order(params[:sort])

     end

     @books = @books.page(params[:page])
     @image = Array.new
     if @books.present?

      for book in @books do
        @image << book.images.first
      end

     end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @image = @book.images.all
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  def find
    @books = @user.where(author: params[:book_author]) if params[:book_author].present?
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user=current_user
    @book.owner=current_user.login
    @book.date_of_realize = Time.new
    respond_to do |format|
      if @book.save
        params[:images]['image'].each do |a|
          @image = @book.images.create!(
              title: @book.title,
              owner: @book.owner,
              image: a
          )
        end
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(
        :title, :author, :price, :page_count, :about, :owner, :date_of_realize,
        :binding, :genre, :book_for_sell, images_attributes: [:id, :books_id, :image])
  end
end
