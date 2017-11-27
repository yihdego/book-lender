require 'rails_helper'

RSpec.describe Shelf, type: :model do
  let!(:user) { User.create(username: 'yihdego', email: 'amanuel@email.com', password: 'password') }
  let!(:user2) { User.new(username: 'bob', email: 'bob@email.com') }
  let!(:book) { {title: "JavaScript and JQuery", author: "Jon Duckett"} }
  let!(:preacher1) { Book.create(title:"Preacher, Book 1: Gone to Texas", author: "Garth Ennis & Steve Dillon") }
  describe 'adding a book to a users shelf' do
    it 'filters the api to grab title and author search result' do
      response = Book.apisearch('Javascript & Jquery')
      selected = response[:items][0][:volumeInfo]
      searchedbook = { title: selected[:title], author: selected[:authors].join(", ") }
      expect(searchedbook).to eq book
    end
    it 'can add a book to a users collection' do
      user.add_book(book)
      expect(user.books).to include Book
    end
    it 'can remove a book from a users collection' do
      user.books << preacher1
      shelf_id = user.shelves.last.id
      user.remove_book(shelf_id)
      expect(user.reload.books).to_not include preacher1
    end
  end
end
