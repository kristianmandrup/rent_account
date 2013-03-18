require 'spec_helper'
# require 'models/shared/account_ex'

describe User::Account::Landlord do
  context 'User' do
    subject { user }

    let(:user) { create :landlord_user }

    describe 'landlord account' do    
      subject { landlord }

      let(:landlord) { user.landlord }

      context 'package :post_property (added)' do
        subject { landlord.package :post_properties }

        it 'should be a post properties package' do
          expect(subject).to be_a User::Account::Landlord::Package::PostProperties
        end

        it 'of type :landlord' do        
          expect(subject.type).to eq :landlord
        end
      end

      describe 'default packages' do
        subject { packages }
        let(:packages) { landlord.packages }

        it 'should have post properties package' do
          expect(subject.post_properties).to_not be_nil
        end

        it 'should not have a Featured Ads package' do
          expect(subject.featured_ads).to be_nil
        end

        it 'should not have any Ad Extras packages' do
          expect(subject.ad_extras).to be_empty
        end

        describe 'allowed_package?' do
          context 'invalid name' do
            it 'should not be allowed' do
              expect(subject.send(:allowed_package?, :invalid)).to be_false
            end
          end

          context 'valid package name :featured_ads' do
            it 'should be allowed' do
              expect(subject.send(:allowed_package?, :featured_ads)).to be_true
            end
          end      
        end
      end

      describe 'package(name)' do
        subject { landlord }

        describe 'invalid name' do
          it 'should raise error' do
            expect { subject.package :invalid }.to raise_error
          end
        end

        describe 'valid package name :featured_ads (not yet added)' do
          it 'should NOT raise error' do
            expect { subject.package :featured_ads }.to_not raise_error
          end

          it 'should be a None package' do
            expect(subject.package :featured_ads).to be_a User::Account::Generic::Package::None
          end

          it 'should be Package of type :none' do
            expect(subject.package(:featured_ads).type).to eq :none
          end
        end
      end
    end
  end
end