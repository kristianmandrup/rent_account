class User
  module Account
    class Tenant < Base    
      # include_concerns :contact_requests

      embedded_in :account, polymorphic: true
    end
  end
end