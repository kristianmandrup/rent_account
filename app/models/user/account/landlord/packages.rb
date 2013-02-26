module User::Account::Tenant < ::User::Account::Base
  class Packages
    include BasicDocument

    embeds_one   :post_properties,  class_name: 'User::Account::Landlord::Package::PostProperties'
    embeds_one   :featured_ads,     class_name: 'User::Account::Landlord::Package::FeaturedAd'
    embeds_many  :ad_extras,        class_name: 'User::Account::Landlord::Package::AdExtras'    
  end
end
