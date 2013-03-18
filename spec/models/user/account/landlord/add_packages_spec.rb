require 'spec_helper'

describe User::Account::Landlord do
  context 'User' do
    subject { user }

    let(:user) { create :landlord_user_w_properties, property_count: 2 }

    describe 'landlord account' do    
      subject { landlord }

      let(:landlord) { user.landlord }

      describe 'added featured_ads package' do
        before do
          landlord.packages << :featured_ads
        end

        it 'should have a Featured Ads package' do
          expect(subject.package :featured_ads).to_not be_nil
        end

        it 'should have all landlord properties as featured ads' do
          expect(subject.package(:featured_ads).properties).to eq subject.properties
        end
      end

      describe 'added ad_extras package' do
        before do
          landlord.packages << :ad_extras
        end

        it 'should have one Ad Extras package' do
          expect(subject.package(:ad_extras).size).to eq 1
        end
      end
    end
  end
end