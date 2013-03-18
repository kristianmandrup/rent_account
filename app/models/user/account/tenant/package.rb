module User::Account
  class Tenant < ::User::Account::Base
    module Package
      extend ActiveSupport::Concern

      included do
        embeds_one :packages,  class_name: 'User::Account::Tenant::Packages', inverse_of: :tenant

        delegate :package, to: :packages

        after_initialize do
          self.packages = User::Account::Tenant::Packages.create tenant: self unless self.packages   
        end
      end
    end
  end
end