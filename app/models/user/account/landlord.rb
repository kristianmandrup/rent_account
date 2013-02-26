class User
  module Account
    class Landlord < Base    
      # include_concerns  :properties

      embedded_in :account, polymorphic: true
    end
  end
end