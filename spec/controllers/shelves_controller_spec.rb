require 'rails_helper'

RSpec.describe ShelvesController, type: :controller do
  let!(:user) { User.create(username: 'yihdego', email: 'amanuel@email.com', password: 'password')}
  let!(:preacher1) { Book.create(title:"Preacher, Book 1: Gone to Texas", author: "Garth Ennis & Steve Dillon") }
  let!(:shelf) { Shelf.create(user: user, book: preacher1) }
  describe 'create' do
    before(:each) { post :create, session: { user_id: user.id }, params: { title: "Javascript & JQuery", author: "Jon Duckett" } }
    it 'increases the users books collection if they dont have the book' do
      expect(user.books.count).to eq 2
    end
  end
  describe 'destroy' do
    before(:each) { delete :destroy, session: { user_id: user.id }, params: { id: shelf.id } }
    it 'decreases the users book collection by one' do
      expect(user.books.count).to eq 0
    end
  end
end
