require 'spec_helper'
# require 'models/shared/account_ex'

describe User::Account::Tenant do
  context 'User' do
    subject { user }

    let(:user) { create :tenant_user }

    describe 'tenant account' do    
      subject { tenant }

      let(:tenant) { user.tenant }

      describe 'package :contact_properties' do
        subject { tenant.package :contact_properties }

        it 'should be a package' do
          expect(subject).to be_a User::Account::Tenant::Package::ContactProperties
        end        

        it 'of type :none' do
          expect(subject.type).to eq :tenant
        end
      end

      describe 'default packages' do
        subject { packages }
        let(:packages) { tenant.packages }

        it 'should have a contact_properties package' do
          expect(subject.contact_properties).to_not be_nil
        end

        it 'should not have a privileged_contact package' do
          expect(subject.privileged_contact).to be_nil
        end

        describe 'allowed_package?' do
          context 'invalid name' do
            it 'should not be allowed' do
              expect(subject.send(:allowed_package?, :invalid)).to be_false
            end
          end

          context 'landlord package name :featured_ads' do
            it 'should not be allowed' do
              expect(subject.send(:allowed_package?, :featured_ads)).to be_false
            end
          end

          context 'valid package name :featured_ads' do
            it 'should be allowed' do
              expect(subject.send(:allowed_package?, :contact_properties)).to be_true
            end
          end      
        end
      end

      describe 'package name' do
        subject { tenant }

        describe 'invalid name' do
          it 'should raise error' do
            expect { subject.package :invalid }.to raise_error
          end
        end

        describe 'valid package name :privileged_contact (not yet added)' do
          it 'should NOT raise error' do
            expect { subject.package :privileged_contact }.to_not raise_error
          end

          it 'should be a None package' do
            expect(subject.package :privileged_contact).to be_a User::Account::Generic::Package::None
          end

          it 'should be Package of type :none' do
            expect(subject.package(:privileged_contact).type).to eq :none
          end
        end
      end
    end
  end
end