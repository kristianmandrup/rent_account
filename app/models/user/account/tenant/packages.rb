class User::Account::Tenant < ::User::Account::Base
  class Packages
    include BasicDocument
    include User::Account::Generic::Packages

    embedded_in  :tenant, class_name: 'User::Account::Tenant', inverse_of: :packages 

    embeds_one :contact_properties,   class_name: 'User::Account::Tenant::Package::ContactProperties', inverse_of: :packages
    embeds_one :privileged_contact,   class_name: 'User::Account::Tenant::Package::PrivilegedContact', inverse_of: :packages

    after_initialize do
      add_default_packages
    end

    def default_packages
      [:contact_properties]
    end

    def allowed_packages
      [:contact_properties, :privileged_contact]
    end
  end
end
