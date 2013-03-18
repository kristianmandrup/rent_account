require 'spec_helper'

# require 'models/shared/account_ex'

describe User do
  subject { user }

  context 'Tenant' do
    let(:user) { create :tenant_user }

    describe 'construction' do
      it 'should have a tenant account' do
        expect(subject.tenant).to be_a User::Account::Tenant
      end

      it 'should have a landlord account' do
        expect(subject.landlord).to be_a User::Account::Landlord
      end      
    end
  end

  context 'Landlord' do
    let(:user) { create :landlord_user }

    describe 'construction' do
      it 'should have a landlord account' do
        expect(subject.landlord).to be_a User::Account::Landlord
      end

      it 'should have a tenant account' do
        expect(subject.tenant).to be_a User::Account::Tenant
      end
    end
  end
end