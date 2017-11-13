require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(username: 'yihdego', email: 'amanuel@email.com', password: 'password') }
  let!(:user2) { User.new(username: 'bob', email: 'bob@email.com') }
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
  end
end
