require 'spec_helper'
require 'models/shared/account_ex'

describe User::Account::Landlord do
  subject { account }

  describe 'New account' do
    subject { landlord_account }

    let(:landlord_account) { create :new_landlord_account }

    specify { subject.should be_a(Landlord::Account) }
    # it_behaves_like "a basic account"
  end

  describe 'Can NOT create account without being embedding in a user' do
    specify do 
      expect { Landlord::Account.create }.to raise_error
    end
  end

  describe 'Can create account embedded in a user' do
    specify do 
      expect { Landlord::Account.create user: user }.to_not raise_error
    end

    let(:user) { create :user }
  end

  describe '.max_tenants_per_property' do    
    let(:account) { create :landlord_account, max_tenants_per_property: 30 }
    
    its(:max_tenants_per_property) { should == 30 }
  end

  describe 'Default Factory account' do    
    let(:account) { create :landlord_account }
    
    it_behaves_like "a basic account"
  end
end
