require 'spec_helper'
require 'models/shared/paid_package_ex'

describe User::Account::Landlord::Packages do
  subject { package }  
  
  let(:landlord_account) { create :landlord_account}

  context 'Default tenant package' do
    let(:package) { create(:landlord_package, account: landlord_account) }

    it_behaves_like "a paid package"
    its(:account) { should be_a Landlord::Account }
  end
end


