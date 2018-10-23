require 'rails_helper'

describe UserServices::Update do
  let!(:user) { FactoryBot.create(:user) }
  let(:service) { UserServices::Update.new(user: user) }

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
    describe '#update' do

      it 'updates user attributes' do
        params = {
          id: 643, # This shouldn't be changed
          first_name: 'Roger',
          last_name: 'Graves'
        }

        service.update(params)

        user.reload
        expect(user.first_name).to eq('Roger')
        expect(user.last_name).to eq('Graves')
        expect(user.id).to_not eq(643)
      end

    end

  end

end