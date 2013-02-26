require 'spec_helper'
require 'models/shared/account_ex'

describe User::Account::Tenant do
  subject { account }

  describe 'New account' do
    subject { tenant }

    let(:tenant) { create :new_tenant_account }

    specify { subject.should be_a(Tenant::Account) }
    # it_behaves_like "a basic account"
  end

  describe 'Can NOT create account without embedding in a user' do
    specify do 
      expect { Tenant::Account.create }.to raise_error
    end
  end

  describe 'Can create account embedded in a user' do
    specify do 
      expect { Tenant::Account.create user: user }.to_not raise_error
    end

    let(:user) { create :user }
  end

  describe 'Default Factory account' do    
    let(:account) { create :tenant_account }
    
    it_behaves_like "a basic account"
  end
end
