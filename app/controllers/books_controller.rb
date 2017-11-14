class BooksController < ApplicationController
  def index
  end

  def search
    @results = Book.apisearch(params[:title])
  end
end
