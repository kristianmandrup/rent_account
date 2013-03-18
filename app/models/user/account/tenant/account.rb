module User::Account
  class Tenant < Base    
    module Account
      extend ActiveSupport::Concern

      included do
        embedded_in :user, class_name: 'User', inverse_of: :tenant_account      
      end

      def tenant?
        true
      end
    end
  end
end