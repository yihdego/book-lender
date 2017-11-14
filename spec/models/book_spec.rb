require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:preacher1) { Book.create(title:"Preacher, Book 1: Gone to Texas", isbn: "9781401245429") }
  describe 'attributes' do
    it 'has a title' do
      expect(preacher1.title).to eq "Preacher, Book 1: Gone to Texas"
    end
    it 'has an isbn' do
      expect(preacher1.isbn).to eq "9781401245429"
    end
  end

  describe 'api call' do
    it 'returns a json object of an api call' do
      expect(Book.apisearch("Preacher").count).to_not eq 0
    end
    it 'returns books even when specific' do
      results = Book.apisearch("Preacher, Book 1: Gone to Texas")
      title = results[:items][0][:volumeInfo][:title]
      expect(title).to eq("Preacher")
    end
  end
end
