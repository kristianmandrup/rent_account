module User::Account::Landlord::Package
  class Base < ::Account::Package::Base
    include Mongoid::Document
    # include BasicDocument

    def type
      :landlord
    end

    def landlord
      packages.landlord
    end
  end
end

