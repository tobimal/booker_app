class BooksController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :index, :show, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]

  def index
      @book = Book.new
    @books = Book.all
    @users = User.all
    @user = User.find(current_user.id)
  end

  def new
    @book = Book.new
  end


  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @book_new =Book.new
    @user = User.find(current_user.id)
    @users =User.all

  end


  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        redirect_to book_path(@book)
       flash[:notice] = "Book was successfully created."
      else
        @books = Book.all
        render :index
      end
  end

  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path
        flash[:notice] = "Book was successfully update."
      else
        render :edit 
         flash[:danger]= "Book"
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed"
  end

  private
 

    def book_params
      params.require(:book).permit(:title, :body)
    end
def correct_user
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to books_path
    end
  end

end
