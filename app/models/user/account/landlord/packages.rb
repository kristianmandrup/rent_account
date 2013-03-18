class User::Account::Landlord < ::User::Account::Base
  class Packages
    include BasicDocument
    include User::Account::Generic::Packages

    embedded_in  :landlord, class_name: 'User::Account::Landlord', inverse_of: :packages 

    embeds_one   :post_properties,  class_name: 'User::Account::Landlord::Package::PostProperties', inverse_of: :packages
    embeds_one   :featured_ads,     class_name: 'User::Account::Landlord::Package::FeaturedAds', inverse_of: :packages
    embeds_many  :ad_extras,        class_name: 'User::Account::Landlord::Package::AdExtras', inverse_of: :packages

    after_initialize do
      add_default_packages
    end

    def allowed_packages
      [:featured_ads, :ad_extras, :post_properties]
    end

    def default_packages
      [:post_properties]
    end

    def max_properties
      post_properties ? post_properties.max_properties : 0
    end
  end
end