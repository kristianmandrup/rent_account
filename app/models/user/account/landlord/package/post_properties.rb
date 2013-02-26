module User::Account::Landlord::Package
  class PostProperties < Base
    embedded_in :packages, class_name: 'User::Account::Landlord::Packages'

    field  :contact_requests,   type: Integer

    def self.make_from package
      self.create 
        price_from(package, Tenant.currency)
        .merge(period_from package)
        .merge(contact_from package)
    end

    def self.contact_from package
      { contact_requests: package[:contact_requests] }
    end

    protected

    def default_duration
      20.days
    end
  end
end

