require 'rails_helper'

describe UserServices::Session do
  let!(:user) { FactoryBot.create(:user) }
  let(:service) { UserServices::Session.new(user: user) }

  describe 'class' do
    it 'exists' do
      expect(service).to be_present
    end

    it 'user attr_reader is present' do
      expect(service.user).to eq(user)
    end
  end


  # TEST SUGGESTIONS (TDD PREFERRED)

  describe 'methods' do
    describe '#login' do

      it 'creates a new user.session record when called' do
        expect{service.login}.to change{Session.count}.by(1)
      end

      it 'returns the new session.key value' do
        key = service.login
        expect(key).to eq(user.reload.sessions.last.key)
      end

    end

    describe '#logout' do

      it 'destroys all sessions for the user'

      it 'returns true'

    end

  end

end