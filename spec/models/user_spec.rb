require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(username: 'yihdego', email: 'amanuel@email.com', password: 'password') }
  describe 'attributes' do
    it 'should have a username' do
      expect(user.username).to eq 'yihdego'
    end
    it 'should have an email' do
      expect(user.email).to eq 'amanuel@email.com'
    end
    it 'should have a password' do
      p user.password
      expect(user.password).to be_a String
    end
  end
end
