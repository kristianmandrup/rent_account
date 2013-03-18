module User::Account
  class Landlord < Base
    module Package
      extend ActiveSupport::Concern

      included do
        embeds_one :packages,  class_name: 'User::Account::Landlord::Packages', inverse_of: :landlord

        delegate :package, to: :packages

        after_create do
          self.packages = User::Account::Landlord::Packages.create landlord: self unless self.packages
        end
      end      
    end
  end
end