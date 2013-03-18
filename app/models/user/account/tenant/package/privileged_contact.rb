module User::Account::Tenant::Package
  # Tenant gets access to Contact landlord some hours (or days) before normal tenants
  class PrivilegedContact < Base
    embedded_in :packages, class_name: 'User::Account::Tenant::Packages', inverse_of: :privileged_contact

    # field  :time,   type: ::Duration, default: default_duration

    class << self
      def default_duration
        20.days
      end    

      def none
        None.new
      end    
    end

    protected

    class None < User::Account::Generic::Package::None
    end        
  end
end
