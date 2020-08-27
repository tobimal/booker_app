class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]
  def show
  	@user = User.find(params[:id])
    @users = User.all
  	@book_new = Book.new
    @books = @user.books
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        redirect_to books_path, notice: 'Book was successfully created.'
      else
        @books = Book.all
        render :index
      end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id), notice: "You have updated user successfully."
     else
     render :edit
     end
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end
  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
end
