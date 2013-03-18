module User::Account::Landlord::Package
  class FeaturedAds < Base
    embedded_in :packages, class_name: 'User::Account::Landlord::Packages', inverse_of: :featured_ads

    has_many :properties, class_name: 'Property', inverse_of: :featured_ads

    delegate :landlord, to: :packages

    alias_method :featured_properties,  :properties
    alias_method :featured_properties=, :properties=

    after_create do
      self.properties = landlord.properties
    end

    def self.none
      None.new
    end

    class None < User::Account::Generic::Package::None
      def properties
        []
      end
    end    
  end
end
