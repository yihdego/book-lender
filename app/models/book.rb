class Book < ApplicationRecord
  has_many :shelves
  has_many :users, through: :shelves
  include HTTParty

  def self.apisearch(title)
    response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{title}+intitle&printType=books", format: :plain)
    JSON.parse(response.body, symbolize_names: true)
  end

end
