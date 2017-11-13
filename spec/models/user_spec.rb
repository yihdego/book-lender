require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(username: 'yihdego', email: 'amanuel@email.com', password: 'password') }
  let!(:user2) { User.new(username: 'bob', email: 'bob@email.com') }
  let!(:preacher1) { Book.create(title:"Preacher, Book 1: Gone to Texas", isbn: "9781401245429") }
  describe 'attributes' do
    it 'should have a username' do
      expect(user.username).to eq 'yihdego'
    end
    it 'should have an email' do
      expect(user.email).to eq 'amanuel@email.com'
    end
    it 'should have a password' do
      expect(user.password).to be_a String
    end

    it 'should not be valid if the confirmation password does not match' do
      user2.password = 'marley'
      user2.password_confirmation = 'legend'
      user2.save
      expect(user2).to_not be_valid
    end

    it 'should be valid if they match' do
      user2.password = 'marley'
      user2.password_confirmation = 'marley'
      user2.save
      expect(user2).to be_valid
    end

    it 'will return the user if password authentication passes' do
      confirmation = User.login('amanuel@email.com', 'password')
      expect(confirmation).to eq(user)
    end

    it 'returns nil if the user logged in wrong info' do
      confirmation = User.login('amanuel@email.com', 'Password')
      expect(confirmation).to be_nil
    end
  end

  describe 'associations' do
    before(:each) do
      user.books << preacher1
      user2.password = 'marley'
      user2.password_confirmation = 'marley'
      user2.save
      user.friends << user2
      user2.friends << user
    end
    it 'has a book in its collection' do
      expect(user.books).to include(preacher1)
    end
    it 'has a friend' do
      expect(user.friends).to include(user2)
    end
    it 'returns a list of books your friends have' do
      expect(user2.friendsbooks).to be_an Array
    end
    it 'includes the book object' do
      expect(user2.friendsbooks).to include(preacher1)
    end
    it 'can find who friends have the exact book' do
      expect(user2.exactbooksearch(preacher1)).to include(user)
    end
    it 'returns empty array if friends dont have exact book' do
      expect(user.exactbooksearch(preacher1)).to_not include(user2)
    end
    xit 'can find a list for friends who have the book you want' do
      expect(user2.booksearch("Preacher")).to include(user)
    end
  end
end
