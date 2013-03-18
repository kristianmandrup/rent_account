module User::Account::Tenant::Package
  class ContactProperties < Base
    embedded_in :packages, class_name: 'User::Account::Tenant::Packages', inverse_of: :contact_properties

    field  :contact_requests,   type: Integer

    class << self
      def make_from package
        self.create 
          price_from(package, Tenant.currency)
          .merge(period_from package)
          .merge(contact_from package)
      end

      def contact_from package
        { contact_requests: package[:contact_requests] }
      end

      def none
        None.new
      end
    end

    protected

    def default_duration
      20.days
    end

    class None < User::Account::Generic::Package::None
    end    
  end
end

