module User::Account
  class Landlord < Base
    module Account
      extend ActiveSupport::Concern

      included do
        embedded_in :user, class_name: 'User', inverse_of: :landlord_account
      end

      def landlord?
        true
      end      
    end
  end
end