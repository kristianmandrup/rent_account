module User::Account::Landlord::Package
  class AdExtras < Base
    embedded_in :packages, class_name: 'User::Account::Landlord::Packages'
  end
end
