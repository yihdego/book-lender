class ShelvesController < ApplicationController

  def index
    user = User.find(session[:user_id])
    @shelf = user.shelves
  end

  def create
    p params
    p book_params
    user = User.find(session[:user_id])
    user.add_book(book_params)
    user.save
    redirect_to shelves_path
  end

  def destroy
    user = User.find(session[:user_id])
    user.remove_book(params[:id])
    redirect_to shelves_path
  end

  private
  def book_params
    params.permit(:title, :author)
  end

end
