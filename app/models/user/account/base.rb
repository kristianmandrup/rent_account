class User
  module Account
    class Base < ::Account::Base
      include BasicDocument

      include_shared    :contactable
      
      # include_concerns  :messaging, for: 'User::Account'      

      embedded_in :user, as: :account
    end
  end
end