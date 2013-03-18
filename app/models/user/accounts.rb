class User
  module Accounts
    extend ActiveSupport::Concern
    
    included do
      attr_accessor :name, :logged_in, :email, :password, :type

      embeds_one :tenant_account,   class_name: 'User::Account::Tenant',    inverse_of: :user
      embeds_one :landlord_account, class_name: 'User::Account::Landlord',  inverse_of: :user

      alias_method :tenant,   :tenant_account
      alias_method :landlord, :landlord_account

      # Ensure a user is always initialized with tenant and landlord accounts
      after_initialize do
        create_tenant unless tenant?
        create_landlord unless landlord?
      end
    end

    def tenant?
      self.tenant_account
    end

    def landlord?
      self.landlord_account
    end

    protected

    # creates a user with pre-configured tenant account
    def create_tenant
      self.tenant_account = User::Account::Tenant.create user: self
    end

    def create_landlord
      self.landlord_account = User::Account::Landlord.create user: self
    end    
  end
end