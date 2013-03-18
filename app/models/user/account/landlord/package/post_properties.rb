module User::Account::Landlord::Package
  class PostProperties < Base
    embedded_in :packages, class_name: 'User::Account::Landlord::Packages', inverse_of: :post_properties

    # nil is no limit
    field   :max_properties, type: Integer, default: 3

    def post_property?
      landlord.property_count < max_properties
    end

    def max_properties= value
      raise ArgumentError, "Currently the app doesn't allow changing max_properties to #{value}, current default value is: #{max_properties}"
    end

    def self.none
      None.new
    end

    class None < User::Account::Generic::Package::None
      def max_properties
        0
      end

      def post_property?
        false
      end
    end
  end
end

