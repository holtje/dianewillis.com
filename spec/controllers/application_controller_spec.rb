# encoding: UTF-8
require 'spec_helper'

describe ApplicationController do
  describe 'current_user' do
    let(:current_user) { subject.send(:current_user) }

    context 'with no user_id in the session' do
      it 'is nil' do
        expect(current_user).to be_nil
      end
    end

    context 'with a valid user_id in the session' do
      let(:user) { FactoryGirl.create :user }

      it 'returns the User' do
        allow(subject).to receive(:session).with.and_return user_id: user.id

        expect(current_user).to eq(user)
      end
    end

    context 'with an invalid user_id in the session' do
      let(:bogus_id) { (User.maximum(:id) || 999) + 1 }

      it 'returns the User' do
        allow(subject).to receive(:session).with.and_return user_id: bogus_id

        expect(current_user).to be_nil
      end
    end
  end
end
