class User
  include Mongoid::Document

  include_concerns  :accounts
end

module User::Account
  class Landlord < Base    
    include_concerns  :properties, :package, :account
  end
end

module User::Account
  class Tenant < Base    
    include_concerns  :package, :account
  end
end