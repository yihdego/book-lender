require 'rails_helper'

RSpec.describe Shelf, type: :model do
  let!(:user) { User.create(username: 'yihdego', email: 'amanuel@email.com', password: 'password') }
  let!(:user2) { User.new(username: 'bob', email: 'bob@email.com') }
  let!(:book) { {title: "Javascript & JQuery", author: "Jon Duckett"} }
  describe 'adding a book to a users shelf' do
    it 'can add a book to a users collection from the api' do
      user.add_book(book)
      expect(user.books).to include Book
    end
    it 'can remove a book from a users collection'
  end
end
