require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: 'email', password: "password") }

  describe 'Validates' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:session_token)}
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'Assocations' do
  end

  describe '#find_by_credentials' do
    context 'with invalid credentials' do
      it 'returns nil' do
        user.save!
        other_user = User.find_by_credentials('email', 'oijasdpd')
        expect(other_user).to be_nil
      end
    end

    context 'with valid credentials' do
      it 'returns the user' do
        user.save!
        other_user = User.find_by_credentials('email', 'password')
        expect(other_user).to eq(user)
      end
    end
  end

  describe '#generate_session_token' do
    it 'returns a string of length 16' do
      expect(User.generate_session_token.length).to be(22)
    end

    it 'returns a random string' do
      random1 = User.generate_session_token
      random2 = User.generate_session_token
      expect(random1).not_to eq(random2)
    end
  end



end
