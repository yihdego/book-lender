require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'index' do
    before(:each) { get :index }
    it 'returns an ok status' do
      expect(response).to be_ok
    end
  end
end
