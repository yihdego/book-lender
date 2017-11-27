require 'rails_helper'

RSpec.describe ShelvesController, type: :controller do
  let!(:user) { User.create(username: 'yihdego', email: 'amanuel@email.com', password: 'password') }
  describe 'index' do
    before(:each) { get :index }
    it 'returns an ok status' do
      expect(response).to be_ok
    end
  end

  describe 'create' do
    before(:each) do
      post :create, params: {"title"=>"JavaScript and JQuery", "author"=>"Jon Duckett", session: {user_id: user.id}}
    end
    it 'creates an assigns @book variable if not found'
    it 'find @book variable if already in the database'
    it 'creates an association of a book to a user'
    it 'redirects to the users shelve index page'
  end
end
