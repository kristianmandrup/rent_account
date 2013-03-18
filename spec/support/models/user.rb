class User
  include Mongoid::Document

  embeds_one :tenant_account,   class_name: 'User::Account::Tenant',   inverse_of: :user
  embeds_one :landlord_account, class_name: 'User::Account::Landlord', inverse_of: :user

  after_initialize do
    create_tenant unless tenant?
    create_tenant unless landlord?
  end
end