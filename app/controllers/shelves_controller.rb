class ShelvesController < ApplicationController

  def create
    user = User.find(session[:user_id])
    user.add_book(book_params)
  end

  private
  def book_params
    params.permit(:title, :author)
  end

end
