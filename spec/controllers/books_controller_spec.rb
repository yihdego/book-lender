require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'index' do
    before(:each) { get :index }
    it 'returns an ok status' do
      expect(response).to be_ok
    end
  end
  describe 'search' do
    before(:each) { get :search, params: { title: "Preacher" } }
    it 'assigns an instance @books that fit the search results' do
      expect(assigns[:results]).to include(:kind, :totalItems, :items)
    end
  end
end
