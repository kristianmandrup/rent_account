module User::Account::Tenant < ::User::Account::Base
  class Packages
    include BasicDocument

    embeds_one :contact_properties, class_name: 'User::Account::Tenant::Package::ContactProperties'
    embeds_one :first_contact,      class_name: 'User::Account::Tenant::Package::FirstContact'
  end
end
