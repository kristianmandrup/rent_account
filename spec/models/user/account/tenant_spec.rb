require 'spec_helper'
# require 'models/shared/account_ex'

describe User::Account::Tenant do
  context 'User' do
    subject { user }

    let(:user) { create :tenant_user }

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should be a tenant' do
      expect(subject.tenant?).to be_true
    end

    context 'Tenant account' do
      subject { tenant }

      let(:tenant) { user.tenant }

      it 'should be valid' do
        expect(subject).to be_valid
      end

      it 'should be a tenant' do
        expect(subject.tenant?).to be_true
      end

      it 'should be a Tenant account' do
        expect(subject).to be_a User::Account::Tenant
      end
      # it_behaves_like "a basic account"
    end
  end
end