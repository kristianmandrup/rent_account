require 'spec_helper'
# require 'models/shared/account_ex'

describe User::Account::Landlord do
  subject { landlord }

  let(:user) { create :landlord_user }

  describe 'landlord account factory' do    
    let(:landlord) { create :landlord_account, user: user }

    # it 'should be valid' do
    #   expect(subject).to be_valid
    # end

    # it 'should be created' do
    #   expect(subject).to be_a User::Account::Landlord
    # end
    
    describe 'property_count' do
      context 'landlord account with 2 properties' do
        let(:landlord) { create :landlord_w_properties, property_count: 2, user: user }

        # before :each do
        #   puts subject.inspect
        #   puts subject.properties.inspect
        # end

        it 'should have properties' do
          expect(subject.properties).to_not be_empty
        end

        it 'should have 2 properties' do
          expect(subject.properties.size).to eq 2
        end

        its(:property_count) { should == 2 }
      end
    end

    describe 'max_properties' do
      # is this possible?
      context 'default Post properties package' do
        its(:max_properties) { should == 3 }
      end
    end
  end
end
