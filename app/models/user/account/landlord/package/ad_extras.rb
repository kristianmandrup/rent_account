module User::Account::Landlord::Package
  class AdExtras < Base
    embedded_in :packages, class_name: 'User::Account::Landlord::Packages', inverse_of: :ad_extras

    def self.none
      None.new
    end

    class None < User::Account::Generic::Package::None
    end    
  end
end
