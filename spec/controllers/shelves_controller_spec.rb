require 'rails_helper'

RSpec.describe ShelvesController, type: :controller do
  let!(:user) { User.create(username: 'yihdego', email: 'amanuel@email.com', password: 'password')}
  describe 'create' do
    before(:each) { post :create, session: { user_id: '1' }, params: { title: "Javascript & JQuery", author: "Jon Duckett" } }
    it 'increases the users books collection if they dont have the book' do
      expect(user.books.count).to eq 1
    end
  end
end
