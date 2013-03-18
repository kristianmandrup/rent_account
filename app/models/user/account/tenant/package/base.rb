module User::Account::Tenant::Package
  class Base < ::Account::Package::Base
    include Mongoid::Document
    # include BasicDocument

    def type
      :tenant
    end
  end
end
