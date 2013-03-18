require 'spec_helper'

describe User::Account::Landlord do
  context 'User' do
    subject { user }

    let(:user) { create :landlord_user }

    context 'Landlord account' do
      subject { landlord }

      let(:landlord) { user.landlord }

      it 'should be valid' do
        expect(subject).to be_valid
      end

      it 'should be created' do
        expect(subject).to be_a User::Account::Landlord
      end

      context 'set max contacts to 30' do
        before do
          subject.max_contacts_per_property = 30
        end
      
        its(:max_contacts_per_property) { should == 30 }
      end
    end    
  end
end