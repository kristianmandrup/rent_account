module User::Account
  class Landlord < Base
    module Properties
      extend ActiveSupport::Concern

      included do
        has_many    :properties,  class_name: 'Property', inverse_of: :landlord

        # nil is no limit
        field :max_contacts_per_property, type: Integer, default: nil
      end

      # default: 1 property per landlord, otherwise as defined by paid package
      def max_properties
        packages ? packages.max_properties : 1
      end

      def property_count
        properties ? properties.size : 0    
      end
    end
  end
end
