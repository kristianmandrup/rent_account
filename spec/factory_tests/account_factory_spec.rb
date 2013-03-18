require 'spec_helper'

describe 'User::Account::Tenant factory' do
  subject { user }

  let(:user) { create :tenant_user }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  context 'tenant account' do    
    subject { tenant }

    let(:tenant) { user.tenant }

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should be created' do
      expect(subject).to be_a User::Account::Tenant
    end    
  end
end
