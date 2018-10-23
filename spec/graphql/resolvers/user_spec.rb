require 'rails_helper'

describe Resolvers::User do
  let!(:user) { FactoryBot.create(:user) }
  let(:resolver) { Resolvers::User.new(user: user) }

  describe 'class' do
    it 'exists' do
      expect(resolver).to be_present
    end

    it 'user attr_reader is present' do
      expect(resolver.user).to eq(user)
    end
  end

  # TEST SUGGESTIONS (TDD PREFERRED)

  describe 'methods' do

    describe '#address' do

      it 'works by separating fields with commas' do
        user.update(street: 'Pleasant Drive', number: 123, postcode: '84939', city: 'Pleasantville', country: 'Republic of California')
        expect(resolver.address).to eq("Pleasant Drive, 123, 84939, Pleasantville, Republic of California")
      end

      it 'skips fields that are blank' do
        user.update(street: 'Pleasant Drive', number: nil, postcode: '84939', city: 'Pleasantville', country: nil)
        expect(resolver.address).to eq("Pleasant Drive, 84939, Pleasantville")
      end

    end

  end

end